variable "instance_name" {
  description = "The name of the instance"
  type        = string
  default     = "default ec2"
}

variable "security_group" {
  description = "The security group for this instance"
  type        = string
  default     = ""

}

variable "internet_gateway" {
  description = "The internet gateway to connecto to the instance"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "The id of the subnet created"
  type        = string
  default     = ""

}
