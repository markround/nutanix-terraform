resource "random_password" "nkp" {
  count = var.password == null ? 1 : 0

  length           = var.password_length
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

locals {
  nkp_password = var.password != null ? var.password : random_password.nkp[0].result
}

resource "nutanix_users_v2" "nkp_user" {
  username    = var.username
  description = var.user_description
  email_id    = var.email_id
  user_type   = var.user_type
  first_name  = var.first_name
  last_name   = var.last_name
  password    = local.nkp_password
}
