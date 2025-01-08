provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "dev" {
  ami               = "ami-0fd05997b4dff7aac"
  instance_type     = "t2.micro"
  key_name          = "multicloud-keypair"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "target-resources"
  }
}

resource "aws_s3_bucket" "dependent1" {
  bucket = "ytvhshfbb123c"
}

#terraform apply -target=aws_s3_bucket.dependent1 -auto-approve
#terraform destroy -target=aws_s3_bucket.dependent1 -auto-approve

# to create only ec2 resource
# terraform apply -target=aws_instance.dev -auto-approve
# terraform destroy -target=aws_instance.dev -auto-approve