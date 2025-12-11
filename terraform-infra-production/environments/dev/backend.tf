terraform {
  backend "s3" {
    bucket = "terraformdevmodule"
    key    = "terraform/dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
