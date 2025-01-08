
resource "aws_instance" "dependent" {
  ami               = "ami-0fd05997b4dff7aac"
  instance_type     = "t2.micro"
  key_name          = "multicloud-keypair"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "dependency-block"
  }
}

resource "aws_s3_bucket" "dependent" {
  bucket = "ytvhshfbb123c"
  depends_on = [ aws_instance.dependent ]
}

# elastic ip create. dont forget to destroy
# resource "aws_eip" "example" {
#   instance   = aws_instance.dependent.id
#   depends_on = [aws_instance.dependent]
# }