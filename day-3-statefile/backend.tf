terraform {
  backend "s3" {
    bucket = "multicloudstatefilebucket"
    key    = "day-3/terraform.tfstate"
    region = "ap-south-1"
    # encrypt        = true
    # dynamodb_table = "your-dynamodb-lock-table" # Optional: For state locking
  }
}
