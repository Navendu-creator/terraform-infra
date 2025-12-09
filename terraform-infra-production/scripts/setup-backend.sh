#!/usr/bin/env bash
# Example: create S3 bucket and DynamoDB table for locking (AWS CLI)
# aws s3api create-bucket --bucket my-terraform-state --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1
# aws dynamodb create-table --table-name terraform-locks --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --region ap-south-1
echo "Edit and run the commented AWS CLI commands to create backend resources."
