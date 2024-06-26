variable "namespace" {
  type    = string
  default = "docker"
}

variable "config_context_cluster" {
  type        = string
  default     = "docker-desktop"
  description = "Kubectl context needed for running the cluster"
}
