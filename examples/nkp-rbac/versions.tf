terraform {
  required_version = ">= 1.3.0"

  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = ">= 2.3.4, < 3.0.0"
    }
  }
}
