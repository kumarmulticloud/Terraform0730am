
# 1. Create VPC

resource "aws_vpc" "dev" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Terraform-VPC"
  }
}

# 2. Create Subnet

# public subnet
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.dev.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "public_subnet"
  }
}

#private subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.dev.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "private_subnet"
  }
}

# 3. Create Internet Gateway and attach VPC

resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id    # attaching VPC to IGW

  tags = {
    Name = "My-IGW" 
  }
}

# Create a NAT gateway

# 4. Create Route Table and edit routes  
resource "aws_route_table" "dev" {
  # vpc id
  vpc_id = aws_vpc.dev.id   
  
  # igw associated
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }  
}

# 5	Subnet Associate to route table. 
resource "aws_route_table_association" "dev" {  

  route_table_id = aws_route_table.dev.id   #slecting route tabel 
  subnet_id = aws_subnet.public.id     # associate public subnet

}

# Subnet association for NAT gateway

# 6.Create SG group and add inbound rule
resource "aws_security_group" "dev" {
  name = "allow_tls"
  vpc_id = aws_vpc.dev.id
  tags = {
    Name = "dev_sg"
  }

#inbound rules 80 & 22
ingress  {
    description = "TLS from VPC"
    # port range 80 -100, here 80-80
    from_port   = 80    
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

ingress  {
    description = "TLS from VPC"
    from_port   = 22    
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  } 

  #outbound rule for any protocol
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks  = ["0.0.0.0/0"]
  }
}
