Environment: staging

Steps:
1. Update `backend.tf` with your S3 bucket, DynamoDB table and region.
2. Copy `terraform.tfvars.example` to `terraform.tfvars` and edit values.
3. Run:
   terraform init
   terraform plan -var-file=terraform.tfvars
   terraform apply -var-file=terraform.tfvars
