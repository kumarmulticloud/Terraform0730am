

provider "tls" {}

# Generate a new private-public key pair using the TLS provider
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create an EC2 key pair in AWS using the generated public key
resource "aws_key_pair" "example" {
  key_name   = "my-ec2-key1"  # Name for the key pair in AWS
  public_key = file("~/.ssh/id_ed25519.pub")  
}

# Output the private key (Be careful when doing this since it contains sensitive information)
output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}

output "publickey" {
  value = aws_key_pair.example.public_key
}

