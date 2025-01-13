resource "aws_key_pair" "name" {
    key_name = "testpublic"
    public_key = file("~/.ssh/id_ed25519.pub")  #here you need to define public key file path  
}

resource "aws_instance" "dev" {
  ami                    = "ami-07b69f62c1d38b012"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.name.key_name
  tags = {
    Name="key-tf"
  }
}