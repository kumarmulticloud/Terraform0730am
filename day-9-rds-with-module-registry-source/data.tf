data "aws_subnet" "public-subnet-1" {
    filter {
      name = "tag:Name"
      values = [ "subnet-1" ]
    }  
}

data "aws_subnet" "public-subnet-2" {
    filter {
      name   = "tag:Name"
      values = [ "subnet-2" ]
    }  
}