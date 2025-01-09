variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance."
  type        = string
  default     = ""
}

variable "instance_name" {
  description = "The name tag for the EC2 instance."
  type        = string
   default    = ""
}

# variable "security_groups" {
#   description = "A list of security group names to attach to the instance."
#   type        = list(string)
#   default     = []
# }

variable "key_name" {
  description = "The name of the key pair to use for the instance."
  type        = string
  default     = ""
}
