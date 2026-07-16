provider "nutanix" {
  username     = var.nutanix_username
  password     = var.nutanix_password
  endpoint     = var.nutanix_endpoint
  port         = var.nutanix_port
  insecure     = var.nutanix_insecure
  wait_timeout = 10
}

module "nkp" {
  source = "../../modules/nkp-rbac"

  # All nkp_user values default to the standard NKP service account.
  # Override any of them as needed, for example:
  #
  # username        = "nkp"
  # email_id        = "nkp@example.com"
  # first_name      = "NKP"
  # last_name       = "Account"
  # password        = "..."   # omit to auto-generate (see nkp_password output)
  # password_length = 16
}

output "nkp_username" {
  description = "Username of the provisioned NKP user account."
  value       = module.nkp.nkp_username
}

output "nkp_password" {
  description = "Password for the provisioned NKP user account."
  value       = module.nkp.nkp_password
  sensitive   = true
}
