variable "environment" {
  type        = string
  description = "Deployment environment (e.g. dev, prod)"
}

variable "labels" {
  type        = map(string)
  description = "Additional custom tags to apply"
  default     = {}
}
