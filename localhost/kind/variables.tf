variable "config_context_cluster" {
  type        = string
  default     = "kind"
  description = "Cluster context"
}

variable "namespace" {
  type        = string
  default     = "application"
  description = "Base namespace"

}

variable "cluster_name" {
  type        = string
  default     = "kind"
  description = "Kind cluster name"

}
