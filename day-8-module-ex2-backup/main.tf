provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }

  # # Optional: Add a security group
  # security_groups = var.security_groups

  # Optional: Add key pair for SSH access
  key_name = var.key_name

  # Optional: Add a user data script
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, EC2 instance!" > /home/ec2-user/hello.txt
              EOF

}
