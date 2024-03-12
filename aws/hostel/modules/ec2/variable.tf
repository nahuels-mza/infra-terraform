variable "instance_name" {
  description = "The name of the instance"
  type        = string
  default     = "hostel"
}

variable "security_group" {
  description = "The security group for this instance"
  type        = string
  default     = ""

}
