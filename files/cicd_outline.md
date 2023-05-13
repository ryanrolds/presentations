# CI/CD

## Overview
* What is CI/CD?
* Why do it?
* How do you do it?

## What is CI/CD?
* Automation of:
  * Continuous Integration
    * Checkout, lint, build, test
  * Continuous Deployment
    * Images, Infrastructure as Code, Gates, Secrets

## Is it worth it?
* Benefits
  * Smaller changes, fewer bugs shipped, faster feedback
  * Developers can focus on code, not process
  * Provides a place to handle team/org standards
* What about individuals?
  * Automation is still useful
  * Can be done locally and moved to the Cloud later
  * Taskfile/Makefile

## Continuous?
* Commits, Branches, Pull Requests
* Workflow Engines
  * GitHub Actions
  * Your cloud provider's
  * ArgoCD (not for CI)
  * Jenkins (deprecated)
  * Many more
* YAML
  * Love it, hate it, learn it

## Integration
* Can I ship this?
* Steps
  * Checkout source code
  * Install dependencies and tools
  * Lint
  * Build
  * Test
  * Image building
* Waiting for CI to run isn't fun
  * Steps runnable locally
  * Maintenance is required
  * Taskfile/Makefile

## Deployment 
* Image pushing
* Infrastructure as Code
  * Pets vs Cattle
  * Terraform 
  * Your cloud provider's
  * Helm (Kubernetes)
* Environments (Test, Staging, Production)
* Gates
  * Manual Approval
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
* Workflows
* Deploying to Test/Staging/QA
* Deploying to Production

# What next?
* Put your projects on GitHub
* Create a Taskfile/Makefile
* Run CI with GitHub Actions
* Build out CI, add CD later
