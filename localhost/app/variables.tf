variable "label" {
  type        = string
  default     = "hostel-app"
  description = "default label for objects"
}

variable "namespace" {
  type    = string
  default = ""
}

variable "config_context_cluster" {
  type        = string
  default     = "docker-desktop"
  description = "Kubectl context needed for running the cluster"
}
