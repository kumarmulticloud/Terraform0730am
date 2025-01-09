resource "aws_instance" "dev" {
  ami = var.ami_id
  instance_type = var.instancetype
  key_name = var.keyname
  availability_zone = var.az
  tags = {
    Name = var.ec2name
  }
}

resource "aws_s3_bucket" "dev" {
  bucket = "asdasdasd8796"
}