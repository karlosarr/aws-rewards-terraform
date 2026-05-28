# Agents Knowledge Base - AWS Rewards Project

## Project Purpose
The goal of this project is to deploy a specific set of AWS resources to fulfill the requirements of an AWS reward program (100 USD credits).

## Infrastructure Overview
The infrastructure is managed via Terraform and is divided into modular components using industry best practices (separation of variables and providers):
- **EC2 Module**: Deploys a `t3.micro` instance (Free Tier) using a pre-existing SSH key named `key-ssh`.
- **Budgets Module**: Sets up a cost budget of 1 USD with an email alert at 80%.
- **Lambda Module**: Deploys a Node.js 18.x function and an HTTP API Gateway.
- **RDS Module**: Deploys a MySQL `db.t3.micro` instance.
- **Bedrock**: Requires manual activation in the AWS Console (Model Access -> Playgrounds).

## Technical Details
- **Region**: Default `us-east-1`.
- **State Management**: Local state.
- **Configuration**: Managed via `terraform.tfvars` (Variables separated into `variables.tf` files).
- **Crucial Files**: 
    - `main.tf`: Root module coordinating the deployment.
    - `providers.tf`: Provider and Terraform version requirements.
    - `variables.tf`: Global variable definitions.
    - `modules/**`: Specialized logic with internal `main.tf` and `variables.tf` separation.
    - `terraform.tfvars`: User-specific secrets and configuration.

## Operational Guide for Agents
When working on this project, always follow these steps:
1. **Validation**: If modifying modules, always run `rm -rf .terraform/modules && terraform init` to ensure the LSP and Terraform core are synced with the latest variable changes.
2. **Secrets**: Never hardcode passwords or emails in `main.tf`. Always use `terraform.tfvars` and mark variables as `sensitive = true` in the module definition.
3. **Cost Control**: Remind the user to run `terraform destroy -auto-approve` once the reward is credited.
4. **Bedrock**: Remember that Bedrock cannot be fully automated via Terraform due to AWS's legal requirement to accept model terms in the console.

## Commands for Verification
- Initialize and deploy: `terraform init && terraform apply -auto-approve`
- Teardown: `terraform destroy -auto-approve`
