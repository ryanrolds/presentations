class: middle, center

# 🏭 CI/CD 🚢
## Stop doing the boring stuff
---
class: middle

# 🫖 About me

* Software Engineer 👨‍💻
* ryanrolds@gmail.com ✉️
* github.com/ryanrolds 🕸️

---
class: middle, center

# 💬 Questions? Comments?

__Raise your hand__✋
<br/>
<br/>
URL: presentations.pedanticorderliness.com<br>
Repo: github.com/ryanrolds/presentations

---
class: middle

# ❓ What is CI/CD?

* Continuous Integration 🏭
* Continuous Deployment 🚢

---
class: middle

# 🔄 Continuous? 

Integration and deployment run automatically on:
* Commits ✍️
* Pull Requests ⬆️
* Branches 🌲

---
class: middle

# 🕔 Is CI/CD worth it?

* Inconsistency causes problems 🔥
* Smaller changes, fewer bugs, faster feedback 🏎️
* Everyone can execute deployments 🚢

---
class: middle

# 🚀 Small teams?

* Less firefighting 👩‍🚒
* Go on vacations 🏝️
* If applied judiciously, it will save you time 💰

---
class: no-margins,center,middle

<img class="height" src="https://imgs.xkcd.com/comics/is_it_worth_the_time.png">

---
class: middle

# Workflow Engines

* GitHub Actions
* Your cloud provider's
* ArgoCD (not for CI)
* Jenkins (deprecated)
* Many more

---
class: middle

# Integration

* Is this shippable?
* Solves "Works on my machine!"

---
class: middle

# Steps

* Checkout source code
* Install dependencies and tools
* Lint
* Build
* Test
* Image building

---
class: middle

# Waiting for CI to run isn't fun

* Steps runnable locally
* Maintenance is required
* Taskfile/Makefile

---
class: middle

# Deployment

* Image pushing 
* Environments (Test, Staging, Production)


---
class: middle

# Infrastructure as Code

* Kubernetes ☸
* Terraform ⛏️
* Your cloud provider's ☁️

---
class: middle

# Gates

* Manual Approval
* Branches
* Baking
* GitOps

---
class: middle

# What does CI/CD look like?

* Commits & Pull Requests
* Branches
* Workflows
* Deploying to Test/Staging/QA
* Promoting to Production

---
class: middle

# Commits & Pull Requests

---
class: middle

# Branches

* Trunk-based 
* GitFlow
* Branches for different environment
* GitOps

---
class: middle

# Workflows

* Run CI
* Build and push Docker iamge
* Deploy if needed
* Build confidence
* Promote
* YAML
  * Love it, hate it, learn it
* GitHub Actions example

---
class: middle

# Deploy to Pre-production

* Deploy all merges to main branch

---
class: middle

# Build confedence

* Manual validation
* Automatic validation

---
class: middle

# Promoting to Production

* Branches
* Baking
* GitOps

---
class: middle

# ⚙️ What next?

* Put your projects on GitHub
* Create a Taskfile/Makefile
* Run CI with GitHub Actions
* Build out CI, add CD later

---
class: middle, center

# Questions❓

---
class: middle, center

# 👏 Thanks

<place holder for next event>

