locals {
  
  nkp_operations = [
    "Create_New_Virtual_Machine",
    "Delete_Existing_Virtual_Machine",
    "Power_On_Virtual_Machine",
    "View_Existing_Virtual_Machine",
    "Update_Virtual_Machine_Custom_Attributes",
    "Create_Category",
    "Delete_Category",
    "Delete_Value_Category",
    "View_Category",
    "View_Cluster",
    "View_Cluster_Pgpu_Profiles",
    "View_Cluster_Vgpu_Profiles",
    "View_Host",
    "Create_Image",
    "Delete_Image",
    "View_Image",
    "View_Domain_Manager",
    "View_Project",
    "View_Subnet",
    "Detach_Volume_Group_From_AHV_VM",
    "View_VPC"
  ]

  csi_operations = [
    "View_Existing_Virtual_Machine",
    "Create_Virtual_Machine_Disk",
    "Delete_Virtual_Machine_Disk",
    "View_Virtual_Machine",
    "View_Category",
    "Create_Category",
    "View_Cluster",
    "View_Domain_Manager",
    "View_Host",
    "View_External_iSCSI_Client",
    "Update_External_iSCSI_Client",
    "Create_Recovery_Point",
    "View_Recovery_Point",
    "Delete_Recovery_Point",
    "Restore_Recovery_Point",
    "Update_Container_Disks",
    "View_Storage_Container",
    "View_Task",
    "View_Volume_Group",
    "View_Volume_Group_Details",
    "Create_Volume_Group",
    "Delete_Volume_Group",
    "Update_Volume_Group_Details",
    "Update_Volume_Group_Categories",
    "View_Volume_Group_Disks",
    "Create_Volume_Group_Disk",
    "Update_Volume_Group_Virtual_Disks",
    "View_Volume_Group_iSCSI_Attachments",
    "Attach_Volume_Group_To_External_iSCSI_Client",
    "Detach_Volume_Group_From_External_iSCSI_Client",
    "View_Volume_Group_VM_Attachments",
    "Attach_Volume_Group_To_AHV_VM",
    "Detach_Volume_Group_From_AHV_VM",
    "View_File_Server",
    "View_File_Server_Share",
    "Create_File_Server_Share",
    "Update_File_Server_Share",
    "Delete_File_Server_Share",
    "Clone_File_Server_Share",
    "View_Snapshot_File_server_Share", # note weird case
    "Create_File_Server_Share_Snapshot",
    "Delete_Snapshot_File_server_Share" # note weird case
  ]
}

data "nutanix_operations_v2" "nkp" {
  for_each = toset(local.nkp_operations)
  filter   = "displayName eq '${each.value}'"
}

data "nutanix_operations_v2" "csi" {
  for_each = toset(local.csi_operations)
  filter   = "displayName eq '${each.value}'"
}
