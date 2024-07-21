
variable "VULTR_API_KEY" {
  type = string
  nullable = false
  description = "vultr provider api key"
}

variable "VULTR_REGION" {
  type = string
  nullable = false
  description = "vultr region"
}

variable "VULTR_CLUSTER_VERSION" {
  type = string
}

variable "VULTR_CLUSTER_NAME" {
  type = string
}