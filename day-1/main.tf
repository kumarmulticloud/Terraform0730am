resource "aws_instance" "dev" {
  ami = var.ami_id
  instance_type = var.instancetype
  key_name = var.keyname
  availability_zone = "ap-south-1a"
  tags = {
    Name = var.ec2name
  }
}