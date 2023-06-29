class: middle, center

# 🏭 CI/CD 🚢
## 😴 Stop doing the boring stuff 😴

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

# Questions❓
# Comments❓

✋__Raise your hand__✋

---
class: middle, no-dots

# What is CI/CD❓

* 🏭 Continuous Integration 
* 🚢 Continuous Deployment 

???
How many people have heard of CI/CD?
How many people use Continuous Integration?
How many people use Continuous Deployment?

---
class: middle, no-dots

# 🔄Continuous

Runs automatically on:
* ✍️ Pushing commits 
* ⬆️ Merging pull requests 
* 🌲 Pushing to select branches 

???
Really anything can trigger CI/CD, but it's commonly driven by Git.
Pushing commits runs CI.
Merging pull requests runs CI & CD.
Merging pull requests to select branches deploys to specific environments.

---
class: middle, no-dots

# ⚙️Integration

* 📋 Does it work as expected? 
* 🔍 Did I follow team standards? 
* 🚢 Can I confidently ship it? 

???
Integration is about building the software and confirming it works as expected.
Build, test, lint, etc.
Northstar is CI passing means you can ship it.

---
class: middle, no-dots

# 🚢Deployment

* ⚙️ Deploy application 
* 👩‍💻 Promote to Production 
* 🏗️ Create infrastructure 

???
Deployment is very much dependent on your application and where it's being deployed.
Creating infrastructure is an often overlooked part of deployments.
Buckets, managed databases, DNS records, etc...

---
class: middle, no-dots

# 🕔Is CI/CD worth it?

* ➖ More tools and maintenance 🧰
* ➖ Requires DevOps skillset 👩‍💻
* ➕ Fewer bugs & faster feedback 🏎️
* ➕ Stop doing repetative non-cognative things 😴
* ➕ Everyone can ship 🚢

???
CI requires additional tools and the skillset to maintain them.
The changes are smaller and easier to rollback.
Developers can ship code as fast as they can build confidence.
If it's repetative and non-cognative, don't do it.
No longer is there one person with specifcal access to deploy.

---
class: middle, no-dots

# 🚀Small teams?

* 👩‍🚒 Less firefighting 
* 🏝️ Leads can go on vacation
* 💰 If applied judiciously, it will save you time 

???
Shipping smaller changes and have a clear path to rolling back means less firefighting.
Leads can go on vacation without worrying about the team's ability to ship.
CI/CD will save you time, but what is worth the effort is subjective

---
class: no-margins,center,middle

<img class="height" src="https://imgs.xkcd.com/comics/is_it_worth_the_time.png">

???
Divide by 5, only a small number of projects are going to care about the 5 year ROI.

---
class: middle, no-dots

# 🔍What does it look like?

* 🏭 Workflows and IaC 
* ✍️ Push commits & merge pull requests 
* 🏃 Run integration 
* ⛵ Deploying to Test/Staging/QA 
* 🚢 Promoting to Production 

???
So, we know what CI/CD is on paper. What does it look like in practice?
Workflows and IaC are the largest changes.
Pushing commits and merging pull requests are the primary triggers.
Running integration and deployments are automatic or push botton

---
class: middle, no-dots

# 🏭Workflow Engines

* 📁 GitHub Actions
* ☁️ Your cloud provider's
* 🍵 Jenkins
* 💯 Many more

???
The larget decision when implementing CI/CD is the workflow engine.
GitHub Actions is quickly becoming the standard.
Cloud Providers have their own offerings.
Jenkins is still around, but predates IaC and repos being a FCS.

---
class: middle, no-dots

# 🏗️Infrastructure as Code

* 🙈 YAML, DSL, code
* 📦 Kubernetes
* ⛏️ Terraform
* ☁️ Your cloud provider's

???
While the Workflow Engine is the largest decision, IaC is the larget change in 
developer behavior and mental models.
Not only is your code versioned controlled, but so is your infrastructure.

---
class: middle, no-dots

# 🖊️Commits & PRs

* ⚙️ Pushing a commit triggers CI workflow
* 🚢 Merging PR triggers CI & CD workflows

???
Major touch points for the everage developer.
It's entirely driven by changes to Git. 
No buttons to tigger CI/CD, except for retrying a workflow.

---
class: middle, no-dots

# ⚙️Integration Steps

* 📝 Checkout source code
* 🧰 Install dependencies and tools
* 🔍 Lint
* 🔧 Build
* 📋 Test
* 🪛 Image building

???
The integration steps are completely dependent on your application and needs.
Some teams have linters, some don't. 
Same for test.
This is also place where quality has the largest downstream impact.
The primary function of CI is to build confidence in what you're wanting to ship.

---
class: middle, no-dots

# 🚢Deployment

* ⛏️ Update infrastructure
* 📦 Container orchestration

???
Entirely dependent on your application and where it's being deployed.
Updating infrastructure is often overlooked and added later.
Not everything uses container orahestration, but it's quickly becoming the standard.

---
class: middle, no-dots

# 🏋️‍♀️Build confidence

* 📋 Manual tests
* 🤖 Automated E2E testing
* 😱 Scream
* ❗ Dashboards and alerts

???
CI helped us build confidence to initially deploy our changs.
What about confidence to promote to production?
Pre-production environments allow us include others in building confidence.

---
class: middle, no-dots

# 🎗️Promotion

* ✅ Manual Approval
* 🌲 Branches
* 🍰 Baking

???
Our changes are in pre-production and we are confident in them.
How do we promote them to production?

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
│   │   ├── deployment.yaml
│   │   ├── ingress.yaml
│   │   └── service.yaml
│   └── values.yaml
└── Makefile
```

???
Github Actions
Helm chart
Makefile for CI steps

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

???
One of the reason's GitHub Actions are popular is just need to make a YAML file in a specific directory.
On pull_request opened, synchronize, or reopened, run the CI
Use some distro image that has the tools you need.
You can always install additional tools in your build steps.


---
class: middle, no-dots

```yaml
- name: Set up Golang
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

???
Another reason GitUb actions are popular, is the marketplace.
Install Go, checkout code, lint, build, test, build and push docker images
This leverages the Makefile, Taskfile is becoming more populate and supports env files.

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

???
This workflow is similar to the previous one, but it runs when there is a commit pushed to the develop branch.
This workflow includes the CI steps and some additional ones related to deployment.

---
class: middle, no-dots

```yaml
- name: Build and push Docker images
  uses: docker/build-push-action@v4
  with:
    tags: |
      docker.example.com/my-service:${{ github.sha }}
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

???
The test environment is on a Kubernetes cluster.
This cluster uses ArgoCD, which is a GitOps tool.
The cluster is configured to watch the chart directory for changes.
When there is a change, it will update the deployment.
The last step in this workflow is to update the image tag in the values.yaml file.
It's common for the chart to live in a central infrastuture repository.
It's possible to dispatch workflows across repositories.

---
class: middle, no-dots

# 📝values.yaml

```yaml
ingress: my-service-test
image:
  repo: docker.example.com/my-service
  tag: a3ab2540624023f336cc682d6d6d4f175eb1eb7f
```

???
The tag is what gets updated in the previous step.

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
        - name: my-service
          image: "{{ .Values.image.repo }}:{{ .Values.image.tag }}"
...
```

???
Then ArgoCD detects a change it hydates the deployment with the update valtes.yaml file.
Then it applies the hydrated resources to the cluster.

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

???
We confirm our changes works as expected.
Now we want to promote to production.
In this workflow, production will deployed when a push is made to the main branch.

---
class: middle, no-dots, smaller-text

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
    docker build -t $ECR_REGISTRY/my-service:$IMAGE_TAG .
    docker push $ECR_REGISTRY/my-service:$IMAGE_TAG
    echo "image=$ECR_REGISTRY/my-service:$IMAGE_TAG" >> $GITHUB_OUTPUT
```

???
We make a PR and merge out changes to main, triggering a deployment to production.
Production is an ECS cluster in AWS us-west-2.
We need to configure AWS credentials and login to ECR.
Then we build, tag, and push the image to ECR.

---
class: middle, no-dots, smaller-text

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

???
This is where it gets funky. The right way to do this would be to move it to EKS.
That would allow me to deploy to Test and Production the same way.
If I wanted to continue to use ECS, then I would use Terraform or CDK.

This approach works, but it's not ideal.
There is little value in spending time on improving this.
I don't plan on standing up another environment in ECS.

We are using the AWS CLI to download the ECS task definition.
The AWS ECS render task updates the image tag.
Finally deploy the updated task definition.

---
class: middle, no-dots

# 🤷What's missing?

* 📝 Makefile with build, test, and lint targets
* 🐙 ArgoCD configuration for Test
* 🏗️ AWS IaC for Production
* 🤫 Secrets management

???
How many of you have used Makefiles?
ArgoCD is configured using K8s resoures, not showing those.
As noted on the last slide there is no IaC for the ECS task or cluster.
The IaC for the test environment does exist in it's own repo.

---
class: middle, no-dots

# ⚙️What next?

* 📝 Script for running CI steps
* 🏃 Run CI with GitHub Actions
* 🐋 Build and push Docker image
* 📦 Deploy to the cloud
* ⛏️ Implement IaC

???
The first step is deciding that CI/CD is important and worth the effort.
Implement a Maketfile/Taskfile that runs the CI steps.
Run CI with GitHub Actions.
Figure out how you deploy your application currently and script it.
Run CI and the script when you merge your PRs.
Implement IaC for your existing infrastructure.

---
class: middle, center

# Questions❓

---
class: middle, center

# 👏 Thanks 👏
