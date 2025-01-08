#!/bin/bash

resources=(
  "aws_s3_bucket.dependent1"
  "aws_instance.dev"
)

for resource in "${resources[@]}"; do
  targets+=" -target=$resource"
  echo "Terraform targets inside : $targets"
done

echo "Terraform targets: $targets"

#terraform apply $targets -auto-approve
terraform destroy $targets -auto-approve

# Will be added Multiple Targets as shown bellow
# terraform apply -target=aws_s3_bucket.dependent1 -target=aws_instance.dev -auto-approve



