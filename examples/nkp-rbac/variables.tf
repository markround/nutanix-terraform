variable "nutanix_username" {
  description = "Username used to authenticate against Prism Central."
  type        = string
}

variable "nutanix_password" {
  description = "Password used to authenticate against Prism Central."
  type        = string
  sensitive   = true
}

variable "nutanix_endpoint" {
  description = "Prism Central endpoint (hostname or IP address)."
  type        = string
}

variable "nutanix_port" {
  description = "Prism Central port."
  type        = number
  default     = 9440
}

variable "nutanix_insecure" {
  description = "Whether to skip TLS certificate verification when connecting to Prism Central."
  type        = bool
  default     = true
}
