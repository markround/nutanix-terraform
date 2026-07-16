variable "username" {
  description = "Username for the NKP user account."
  type        = string
  default     = "nkp"
}

variable "user_description" {
  description = "Description attached to the NKP user account."
  type        = string
  default     = "NKP User Account"
}

variable "email_id" {
  description = "Email address for the NKP user account."
  type        = string
  default     = "nkp@example.com"
}

variable "user_type" {
  description = "Type of the NKP user account (e.g. LOCAL, SAML, LDAP, SERVICE_ACCOUNT). NKP uses a LOCAL service account by default."
  type        = string
  default     = "LOCAL"
}

variable "first_name" {
  description = "First name for the NKP user account."
  type        = string
  default     = "NKP"
}

variable "last_name" {
  description = "Last name for the NKP user account."
  type        = string
  default     = "Account"
}

variable "password" {
  description = "Password for the NKP user account. If null (the default), a random password is generated and exposed via the nkp_password output."
  type        = string
  default     = null
  sensitive   = true
}

variable "password_length" {
  description = "Length of the generated password. Only used when var.password is null."
  type        = number
  default     = 16

  validation {
    condition     = var.password_length >= 8
    error_message = "password_length must be at least 8 characters."
  }
}
