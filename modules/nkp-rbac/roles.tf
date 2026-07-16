resource "nutanix_roles_v2" "nkp_role" {
  display_name = "NKP Role"
  description  = "NKP Role"
  operations = [
    for op in local.nkp_operations :
    data.nutanix_operations_v2.nkp[op].operations[0].ext_id
  ]
}

resource "nutanix_roles_v2" "csi_role" {
  display_name = "CSI Role"
  description  = "CSI Role"
  operations = [
    for op in local.csi_operations :
    data.nutanix_operations_v2.csi[op].operations[0].ext_id
  ]
}
