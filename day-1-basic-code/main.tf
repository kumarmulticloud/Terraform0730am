resource "aws_instance" "dev" {
  ami = var.ami_id
  instance_type = var.instancetype
  key_name = var.keyname
  tags = {
    Name = var.ec2name
  }
}