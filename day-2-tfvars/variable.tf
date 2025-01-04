variable "amiid" {
  description = "inserting ami id"
  type        = string
  default     = ""
}

variable "type" {
  description = "inserting instance type"
  default     = ""
  type        = string
}

variable "keyname" {
  description = "inserting key name"
  default     = ""
  type        = string
}

variable "Name" {
  description = "inserting tag Name"
  default     = ""
  type        = string
}