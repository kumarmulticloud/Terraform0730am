variable "ami_id" {
  description = "inserting ami value to main.tf"
  type = string
  default = ""
  #default = "ami-0fd05997b4dff7aac"
}

variable "instancetype" {
  description = "defining instace type in main.tf"
  type = string
  default = ""
  #default = "t2.micro"
}

variable "keyname" {
  description = "key name"
  type = string
  default = ""
  #default = "multicloud-keypair"
}

variable "ec2name" {
  type = string
  default = ""
  #default = "ec2"
}

variable "az" {
  type = string
  default = ""
  #default = "ap-south-1a"
}

variable "bucket-name-s3" {
  type = string
  default = ""
}
