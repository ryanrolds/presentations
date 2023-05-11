# CI/CD

## Overview
* What is CI/CD?
* Why do it?
* How do you do it?

## What is CI/CD?
* Continuous Integration
  * Checkout, lint, build, test
* Continuous Deployment
  * Images, Infrastructure, Gates

## Is it worth it?
* Benefits
  * Faster developer loop
  * TODO: more
* For teams?
  * Easier onboarding
* For individuals?
  * Concepts are still useful
  * Can be done locally and duplicated in the Cloud later
  * Taskfile/Makefile

## Continuous?
* Commits, Branches, Pull Requests
* Runners
  * GitHub Actions
  * Your cloud providers
  * ArgoCD (not for CI)
  * Jenkins (deprecated)
  * Many more
* YAML
  * Love it, hate it, learn it

## Integration
* Checkout source code
* Install dependencies and tools
* Lint
* Build
* Test
* Taskfile/Makefile

## Deployment 
* Docker images
* Infrastructure as Code
  * Terraform 
  * Your cloud provider's
  * Helm (Kubernetes)
* Environments (Test, Staging, Production)
  * Why no QA?
* Gates
  * Branches
  * Baking
  * GitOps
* Secrets management
  * GitHub Secrets
  * Your cloud provider's
  * SOPS
  * Many more

## What does CI/CD look like?
* Pull Requests
* Build Pipelines
* Deploying to Test/Staging/QA
* Deploying to Production

# What next?
* Put your projects on GitHub
* Create a Taskfile/Makefile
* Run CI with GitHub Actions
