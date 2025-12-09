terraform {
  backend "s3" {
    bucket         = "REPLACE_WITH_YOUR_BUCKET"
    key            = "terraform/prod/terraform.tfstate"
    region         = "REPLACE_REGION"
    dynamodb_table = "REPLACE_DYNAMODB_TABLE"
    encrypt        = true
  }
}
