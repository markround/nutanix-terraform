resource "nutanix_authorization_policy_v2" "nkp" {
  role                      = nutanix_roles_v2.nkp_role.ext_id
  display_name              = "NKP"
  description               = "NKP Role Authorization"
  authorization_policy_type = "USER_DEFINED"
  identities {
    reserved = "{\"user\":{\"uuid\":{\"anyof\":[\"${nutanix_users_v2.nkp_user.ext_id}\"]}}}"
  }
  entities {
    reserved = "{\"*\":{\"*\":{\"eq\":\"*\"}}}"
  }
}

resource "nutanix_authorization_policy_v2" "csi" {
  role                      = nutanix_roles_v2.csi_role.ext_id
  display_name              = "CSI"
  description               = "CSI Role Authorization"
  authorization_policy_type = "USER_DEFINED"
  identities {
    reserved = "{\"user\":{\"uuid\":{\"anyof\":[\"${nutanix_users_v2.nkp_user.ext_id}\"]}}}"
  }
  entities {
    reserved = "{\"*\":{\"*\":{\"eq\":\"*\"}}}"
  }
}

