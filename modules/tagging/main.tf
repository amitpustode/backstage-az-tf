locals {
  default_tags = merge(
    {
      Environment   = var.environment
      ManagedBy     = "Terraform"
    },
    var.labels
  )
}