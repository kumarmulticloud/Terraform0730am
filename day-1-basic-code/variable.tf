variable "ami_id" {
  description = "inserting ami value to main.tf"
  type = string
  default = "ami-0fd05997b4dff7aac"
}

variable "instancetype" {
  description = "defining instace type in main.tf"
  type = string
  default = "t2.micro"
}

variable "keyname" {
  description = "key name"
  type = string
  default = "multicloud-keypair"
}

variable "ec2name" {
  type = string
  default = "TerraformEc2-v"
}