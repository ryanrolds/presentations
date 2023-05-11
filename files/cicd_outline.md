# CI/CD

## Overview
* What is CI/CD?
* Why do it?
* How do you do it?

## What is CI/CD?
* Continuous Integration
  * Linting, building, testing
* Continuous Deployment
  * Images, Infrastructure, Deployments

## Is it worth it?
* Benefits
  * Faster developer loop
  * 
* For teams?
  * Easier onboarding
* For individuals?
  * Concepts are still useful
  * Can be done locally and moved to the Cloud later
  * Taskfile/Makefile

## Continuous?
* Commits, Branches, Pull Requests
* Runners
  * GitHub Actions (free)
  * Your cloud providers
  * ArgoCD (not for CI)
  * Jenkins (deprecated)
  * Many more
* YAML
  * Love it, hate it, learn it

## Integration
* Lint
* Build
* Test

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
  * SOPS
  * GitHub Secrets
  * Your cloud provider's
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
