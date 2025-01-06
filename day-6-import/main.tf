resource "aws_instance" "example" {
  ami = "ami-0fd05997b4dff7aac"
  instance_type = "t2.nano"
  key_name = "multicloud-keypair"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "ec2-import"
  }
}