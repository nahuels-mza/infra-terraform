variable "ingress_port" {
  type    = list(number)
  default = [80, 8080, 443]

}
variable "egress_port" {
  type    = list(number)
  default = [80, 80, 443, 0]

}
variable "vpc_id" {
  description = "The VPC id previously created"
  type        = string
  default     = ""

}
