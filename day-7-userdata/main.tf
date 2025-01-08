resource "aws_instance" "dependent" {
  ami               = "ami-0fd05997b4dff7aac"
  instance_type     = "t2.micro"
  key_name          = "multicloud-keypair"
  availability_zone = "ap-south-1a"
  user_data = file("script.sh")
  tags = {
    Name = "userdata-terraform"
  }
}