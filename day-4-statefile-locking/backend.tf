# Run first Terraform0730am/day-3-statefile-s3-dynamodb-resource to create resource
# This backend configuration instruct Terraform to store its state in an S3 bucket

terraform {
  backend "s3" {
    bucket = "nareshs3bucketlockingex" # Name of s3 bucket where the state file store
    region = "ap-south-1"
    key = "day-4/terraform.tfstate" #Pathe within the bucket where the state file located with the name
    dynamodb_table = "terraform-statefile-lock-dynamo" # Dynamodb table used for locking
    encrypt = true  # Ensure the state is encripted at rest in S3    
  }
}