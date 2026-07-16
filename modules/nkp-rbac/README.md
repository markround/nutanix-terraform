# nkp-rbac

Terraform/OpenTofu module that provisions a dedicated Prism Central identity and
RBAC objects for [NKP (Nutanix Kubernetes Platform)](https://www.nutanix.com/products/kubernetes-platform).

It creates:

- a local user account (default username `nkp`),
- a NKP role and a CSI role, each built from the specific Prism Central
  operations NKP/Nutanix CSI requires,
- authorization policies binding the user to those roles across all entities.

## Usage

```hcl
# Example - configure the provider
provider "nutanix" {
  username = var.nutanix_username
  password = var.nutanix_password
  endpoint = var.nutanix_endpoint
  port     = 9440
  insecure = true
}

module "nkp" {
  source = "git::https://github.com/markround/nutanix-terraform.git//modules/nkp-rbac"

  # All inputs are optional, but you can override them, e.g.
  # username = "nkp-account"
  # email_id = "nkp@example.com"
}

output "nkp_password" {
  value     = module.nkp.nkp_password
  sensitive = true
}
```

## Password handling

By default the module generates a random 16-character password for the user and
exposes it via the sensitive `nkp_password` output. To supply your own password
instead, set `var.password`; the random password is then not created.

## Requirements

| Name      | Version              |
| --------- | -------------------- |
| terraform | `>= 1.3.0`           |
| nutanix   | `>= 2.3.4, < 3.0.0`  |
| random    | `>= 3.5.0, < 4.0.0`  |

## Inputs

| Name              | Description                                                                                                   | Type     | Default              |
| ----------------- | ------------------------------------------------------------------------------------------------------------- | -------- | -------------------- |
| `username`        | Username for the NKP user account.                                                                            | `string` | `"nkp"`              |
| `user_description`| Description attached to the NKP user account.                                                                 | `string` | `"NKP User Account"` |
| `email_id`        | Email address for the NKP user account.                                                                       | `string` | `"nkp@example.com"`  |
| `user_type`       | Type of the NKP user account (e.g. `LOCAL`, `SAML`, `LDAP`, `SERVICE_ACCOUNT`).                                | `string` | `"LOCAL"`            |
| `first_name`      | First name for the NKP user account.                                                                          | `string` | `"NKP"`              |
| `last_name`       | Last name for the NKP user account.                                                                           | `string` | `"Account"`          |
| `password`        | Password for the NKP user. If `null`, a random password is generated and exposed via the `nkp_password` output. | `string` | `null`               |
| `password_length` | Length of the generated password. Only used when `password` is `null`. Must be `>= 8`.                        | `number` | `16`                 |

## Outputs

| Name                              | Description                                                        |
| --------------------------------- | ------------------------------------------------------------------ |
| `nkp_user_ext_id`                 | External ID (UUID) of the NKP user account.                        |
| `nkp_username`                    | Username of the NKP user account.                                  |
| `nkp_password`                    | Password for the NKP user account (generated or supplied). Sensitive. |
| `nkp_role_ext_id`                 | External ID of the NKP role.                                       |
| `csi_role_ext_id`                 | External ID of the CSI role.                                       |
| `nkp_authorization_policy_ext_id` | External ID of the NKP authorization policy.                       |
| `csi_authorization_policy_ext_id` | External ID of the CSI authorization policy.                       |

## Notes

- The NKP and CSI operation lists are maintained as internal `locals` in
  [`operations.tf`](operations.tf); They are built up from the official
  Nutanix documentation:
  - NKP role: [Prism Central role permissions](https://portal.nutanix.com/page/documents/details?targetId=Nutanix-Kubernetes-Platform-v2_18:top-prism-central-role-permissions-r.html)
  - CSI Driver role: [CSI non-admin permissions list](https://portal.nutanix.com/page/documents/details?targetId=CSI-Volume-Driver:csi-csi-non-admin-permissions-list-r.html)

