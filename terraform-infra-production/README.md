# Terraform Infra — Production-ready scaffold

This repository provides a production-ready, reusable Terraform structure for AWS EKS with:
- Modules: networking, eks, iam
- Environments: dev, staging, prod (each with separate backend configs)
- Recommended patterns: S3 backend with DynamoDB locking, pinned provider versions, input validation, outputs.

**How to use**
1. Copy this repo.
2. Update `environments/<env>/backend.tf` with your S3 bucket and DynamoDB table.
3. Fill secrets/credentials using secure methods (AWS IAM, environment, or CI variables).
4. Run `terraform init` inside the chosen environment directory, then `terraform plan` and `terraform apply`.

