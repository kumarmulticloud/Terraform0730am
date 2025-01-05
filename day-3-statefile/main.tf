resource "aws_instance" "dev" {
  ami = "ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  key_name = "multicloud-keypair"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "StateFileExample"
  }
}
