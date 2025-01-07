# 7.	Steps provide internet to Private Server in Secure way.
# 7.1.	Select public subnet
# 7.2.	Create NAT Gateway inside public subnet.
# 7.3.	Allocate elastic ip for nat gateway.
# 7.4.	NAT gw connectivity type = public
# 7.5.	Create Private Route table for NAT
# 7.6.	Edit private routes and Provide Path from NAT Gateway to Private Route Table.
# 7.7.	Add Private Subnet association in private route table

# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
   domain   = "vpc" 
}

# NAT Gateway
resource "aws_nat_gateway" "nat" {
  subnet_id     = aws_subnet.public.id #public subnet
  allocation_id = aws_eip.nat.id  # Elastic IP  

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.dev]  
}

# Private Route Table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.dev.id         // vpc attach

  tags = {
    Name = "private-route-table"
  }
}

# Association : Route to NAT Gateway in Private Route Table
resource "aws_route" "private-nat" {
  route_table_id = aws_route_table.private-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id  
}

# Private Route Table Association
resource "aws_route_table_association" "private-ass" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}
