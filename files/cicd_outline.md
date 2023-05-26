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

## Is CI/CD worth it?
* Automation
  * Humans don't perform the same action the same way every time
  * Inconsistency will cause incidents and data problems
  * Faster & continous
  * Everyone can execute deployments
* Benefits
  * Shipping smaller, fewer bugs
  * Faster feedback
  * Developers can focus on code, not process
  * Provides a place to handle team/org standards
  * You can take vacations
* What about individuals and small teams?
  * If applied judiciously, it will save you time
    * https://xkcd.com/1205/
  * You will do less firefighting
  * Steps can be run locally and moved a workflow engine later

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
