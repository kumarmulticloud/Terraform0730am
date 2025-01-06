# 7.Create servers.

resource "aws_instance" "dev" {
  ami = "ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  key_name = "multicloud-keypair"
  associate_public_ip_address = true  # enable public

  tags = {
    Name = "CustomeNW-T"
  }
  subnet_id = aws_subnet.public.id
  security_groups = [aws_security_group.dev.id]

}