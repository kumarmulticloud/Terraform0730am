# 7.Create public servers.

resource "aws_instance" "dev" {
  ami = "ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  key_name = "multicloud-keypair"
  associate_public_ip_address = true  # enable public

  tags = {
    Name = "CustomeNW-public"
  }
  subnet_id = aws_subnet.public.id
  security_groups = [aws_security_group.dev.id]

}

# 8.Create private servers.
resource "aws_instance" "pri" {
  ami = "ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  key_name = "multicloud-keypair"

  tags = {
    Name = "CustomeNW-private"
  }
  subnet_id = aws_subnet.private.id
  security_groups = [aws_security_group.dev.id]

}