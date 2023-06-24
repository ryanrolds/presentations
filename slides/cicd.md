class: middle, center

# 🏭 CI/CD 🚢
## Stop doing the boring stuff

???
Welcome

---
class: middle, no-dots

# 🫖About me

* 👨‍💻 Software Engineer 
* ✉️ ryan.r.olds@gmail.com 
* 🕸️ github.com/ryanrolds 

???
Software Engineer.
Done a bit of everything.
Current focus is SRE and DevOps.

---
class: middle, center

# Questions❓ Comments❓

✋__Raise your hand__✋

---
class: middle, no-dots

# What is CI/CD❓

* 🏭 Continuous Integration 
* 🚢 Continuous Deployment 

???
How many people have heard of CI/CD?
How many people use CI/CD?
How many have tests, linking, and other other integration steps and runn them manually?

---
class: middle, no-dots

# 🔄 Continuous

Runs automatically on:
* ✍️ Pushing commits 
* ⬆️ Merging pull requests 
* 🌲Select branches 

???
Really anything can trigger CI/CD, but it's commonly driven by Git.
Pushing commits runs CI.
Merging pull requests runs CI & CD.
Merging pull requests to select branches deploys to specific environments.

---
class: middle, no-dots

# ⚙️ Integration

* 📋 Does it work as expected? 
* 🔍 Did I follow team standards? 
* 🚢 Can I confidently ship it? 

???


---
class: middle, no-dots

# 🚢Deployment

* 🏗️ Create infrastructure 
* ⚙️ Deploy application 
* 👩‍💻 Promote to Production 

---
class: middle, no-dots

# 🕔Is CI/CD worth it?

* ➖ More tools and maintenance 🧰
* ➖ Requires DevOps skillset 
* ➕ Smaller changes, fewer bugs, faster feedback 🏎️
* ➕ Developer cadence 🏃
* ➕ Everyone can ship code 🚢
* ➕ Leads can take a vacation 🏖️

---
class: middle, no-dots

# 🚀Small teams?

* 👩‍🚒 Less firefighting 
* 🏝️ Go on vacations 
* 💰 If applied judiciously, it will save you time 

---
class: no-margins,center,middle

<img class="height" src="https://imgs.xkcd.com/comics/is_it_worth_the_time.png">

---
class: middle,no-dots

# 🔍What does it look like?

* 🏭 Workflows and IoC 
* ✍️ Push commits & merge pull requests 
* 🏃 Run integration 
* ⛵ Deploying to Test/Staging/QA 
* 🚢 Promoting to Production 

---
class: middle, no-dots

# 🏭Workflow Engines

* 📁 GitHub Actions
* 🍵 Jenkins
* ☁️ Your cloud provider's
* 💯 Many more

---
class: middle, no-dots

# 🏗️Infrastructure as Code

* 🙈 YAML, DSL, code
* 📦 Kubernetes
* ⛏️ Terraform
* ☁️ Your cloud provider's

---
class: middle, no-dots

# 🖊️Commits & PRs

* ⚙️ Pushing commit triggers CI workflow
* 🚢 Merging PR triggers CI and deployment workflows

---
class: middle, no-dots

# ⚙️Integration Steps

* 📝 Checkout source code
* 🧰 Install dependencies and tools
* 🔍 Lint
* 🔧 Build
* 📋 Test
* 🪛 Image building

---
class: middle, no-dots

# 🚢Deployment

* ⛏️ Update infrastructure
* 📦 Container orchestration

---
class: middle, no-dots

# 🏋️‍♀️Build confidence

* 📋 Manual tests
* 😱 Scream
* ❗ Dashboards and alerts
* 🤖 Automated E2E testing

---
class: middle, no-dots

# 🎗️Promotion

* ✅ Manual Approval
* 🌲 Branches
* 🍰 Baking

---
class: middle, no-dots

# 📁Repository Structure

```bash
├── .github
│   └── workflows
│       ├── commit.yaml
│       ├── production.yaml
│       └── test.yaml
├── chart
│   ├── Chart.yaml
│   ├── templates
│   │   ├── _helpers.tpl
│   │   ├── deployment.yaml
│   │   ├── ingress.yaml
│   │   └── service.yaml
│   └── values.yaml
├── docker-compose.yml
└── Makefile
```

---
class: middle, no-dots

# 🖊️Commit Worfklow

```yaml
name: test
on:
  pull_request:
    types: [opened, synchronize, reopened]
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      ...
```

---
class: middle, no-dots

```yaml
- name: Set up Go 1.x
  uses: actions/setup-go@v2

- name: Check out code
  uses: actions/checkout@v2

- name: Lint
  run: make lint

- name: Build
  run: make build

- name: Run tests
  run: make test

- name: Build and push Docker images
  uses: docker/build-push-action@v1.1.0
  with:
    push: false
```

---
class: middle, no-dots

# ⛵Test workflow

```yaml
name: test
on:
  push:
    branches: [ develop ]
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      ...
```

---
class: middle, no-dots

```yaml
- name: Build and push Docker images
  uses: docker/build-push-action@v4
  with:
    tags: |
      docker.example.com/blog:${{ github.sha }}
    push: true

- name: Update values.yaml
  uses: fjogeleit/yaml-update-action@main
  with:
    valueFile: 'chart/values.yaml'
    propertyPath: 'image.tag'
    value: '${{ github.sha }}'
    commitChange: true
    message: 'Update Image Version to "${{ github.sha }}' 
```

---
class: middle, no-dots

# 📝values.yaml

```yaml
ingress: blog-test
image:
  repository: docker.example.com/my-service
  tag: a3ab2540624023f336cc682d6d6d4f175eb1eb7f
```

---
class: middle, no-dots

# 📝deployment.yaml

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-service-test
spec:
  template:
      containers:
        - name: blog
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
...
```

---
class: middle, no-dots

# 🚢Production workflow

```yaml
name: production
on:
  push:
    branches: [ main ]
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      ...
```

---
class: middle, no-dots

```yaml
- name: Configure AWS credentials
  uses: aws-actions/configure-aws-credentials@v1
  with:
    aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
    aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    aws-region: us-west-2

- name: Login to Amazon ECR
  id: login-ecr
  uses: aws-actions/amazon-ecr-login@v1

- name: Build, tag, and push image to Amazon ECR
  id: build-image
  env:
    ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
    IMAGE_TAG: ${{ github.sha }}
  run: |
    docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
    docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
    echo "image=$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG" >> $GITHUB_OUTPUT
```

---
class: middle, no-dots, text-smaller

```yaml
- name: Download task definition
  run: |
    aws ecs describe-task-definition \
    --task-definition my-service \
    --query taskDefinition > task-definition.json

- name: Fill in the new image ID in the Amazon ECS task definition
  id: task-def
  uses: aws-actions/amazon-ecs-render-task-definition@v1
  with:
    task-definition: task-definition.json
    container-name: my-service
    image: ${{ steps.build-image.outputs.image }}

- name: Deploy Amazon ECS task definition
  uses: aws-actions/amazon-ecs-deploy-task-definition@v1
  with:
    task-definition: ${{ steps.task-def.outputs.task-definition }}
    service: my-service
    cluster: production
```

---
class: middle, no-dots

# 🤷What's missing?

* Makefile with build, test, and lint targets
* ArgoCD configuration for Test
* AWS infrastructure for Production
* Secrets management

---
class: middle, no-dots

# ⚙️What next?

* 📝 Script for running CI steps
* 🏃 Run CI with GitHub Actions
* 🐋 Build and push Docker image
* 📦 Deploy to the cloud
* ⛏️ Implement IoC

---
class: middle, center

# Questions❓

---
class: middle, center

# 👏 Thanks 👏

<place holder for next event>
