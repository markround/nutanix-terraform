output "nkp_user_ext_id" {
  description = "External ID (UUID) of the NKP user account."
  value       = nutanix_users_v2.nkp_user.ext_id
}

output "nkp_username" {
  description = "Username of the NKP user account."
  value       = nutanix_users_v2.nkp_user.username
}

output "nkp_password" {
  description = "Password for the NKP user account (generated or supplied via var.password)."
  value       = local.nkp_password
  sensitive   = true
}

output "nkp_role_ext_id" {
  description = "External ID of the NKP role."
  value       = nutanix_roles_v2.nkp_role.ext_id
}

output "csi_role_ext_id" {
  description = "External ID of the CSI role."
  value       = nutanix_roles_v2.csi_role.ext_id
}

output "nkp_authorization_policy_ext_id" {
  description = "External ID of the NKP authorization policy."
  value       = nutanix_authorization_policy_v2.nkp.ext_id
}

output "csi_authorization_policy_ext_id" {
  description = "External ID of the CSI authorization policy."
  value       = nutanix_authorization_policy_v2.csi.ext_id
}
