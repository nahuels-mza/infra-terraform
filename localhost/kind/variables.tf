variable "config_context_cluster" {
  type        = string
  default     = "kind"
  description = "Cluster context"
}

variable "namespace" {
  type        = string
  default     = "kind"
  description = "Base namespace"

}
