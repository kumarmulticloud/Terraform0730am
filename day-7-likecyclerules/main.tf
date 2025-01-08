provider "aws" {
  
}

resource "aws_instance" "dev" {
  ami =  "ami-0fd05997b4dff7aac"
  instance_type = "t2.micro"
  key_name = "multicloud-keypair"
   availability_zone = "ap-south-1b"
  tags = {
    Name = "LifeCycleRules"
  }

#   lifecycle {
#     create_before_destroy = true # create first and then delete
#   }

#   lifecycle {
#     ignore_changes = [ tags,instance_type ]
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
}