# Basic NKP RBAC example

This example provisions the Nutanix Prism identity and RBAC objects required to
operate [NKP (Nutanix Kubernetes Platform)](https://www.nutanix.com/products/kubernetes-platform)
by calling the [`nkp-rbac`](../../modules/nkp-rbac) module.

It creates:

- a local **`nkp`** user account,
- an **NKP role** and a **CSI role** built from the required Prism Central operations,
- **authorization policies** binding the user to those roles.

The example configures the `nutanix` provider (which the module deliberately does
not do itself) and passes the module its default values, so a plain apply gives
you the standard NKP service account. Override any of the `module "nkp"` inputs
in [`main.tf`](main.tf) to customise the user.

## Usage

### 1. Provide connection details

The Prism Central connection settings are inputs to this example, not the module.
Set them however you prefer:

- a `terraform.tfvars` file — copy [`terraform.tfvars.example`](terraform.tfvars.example)
  to `terraform.tfvars` and edit it, or
- `TF_VAR_*` environment variables, or
- the `tf.sh` wrapper described below.

| Variable            | Required | Default | Description                                          |
| ------------------- | -------- | ------- | ---------------------------------------------------- |
| `nutanix_username`  | yes      | —       | Prism Central username used to authenticate.         |
| `nutanix_password`  | yes      | —       | Prism Central password (sensitive).                  |
| `nutanix_endpoint`  | yes      | —       | Prism Central hostname or IP address.                |
| `nutanix_port`      | no       | `9440`  | Prism Central port.                                  |
| `nutanix_insecure`  | no       | `true`  | Skip TLS certificate verification when connecting.   |

### 2. Apply

```sh
terraform init
terraform apply
```

(or `tofu init` / `tofu apply`).

### 3. Retrieve the generated password

If you did not set `module.nkp.password`, the module generates a random password
for the `nkp` user. Read it from the sensitive output:

```sh
terraform output -raw nkp_password
```

## The `tf.sh` wrapper

[`tf.sh`](tf.sh) is a small convenience wrapper for driving this example. It maps
the environment variables commonly exported when deploying NKP (`NUTANIX_USER` etc.) onto the
`TF_VAR_*` variables this example expects, then runs OpenTofu (preferred) or
Terraform:

- prefers `tofu` if it is on your `PATH`,
- falls back to `terraform` if not,
- prints a warning and exits if neither is found.

It reads these environment variables, which are commonly used by the `nkp` CLI when deploying:

| Environment variable | Mapped to `TF_VAR_` |
| -------------------- | ------------------- |
| `NUTANIX_USER`       | `nutanix_username`  |
| `NUTANIX_PASSWORD`   | `nutanix_password`  |
| `NUTANIX_ENDPOINT`   | `nutanix_endpoint`  |
| `NUTANIX_PORT`       | `nutanix_port`      |

Any arguments you pass to `tf.sh` are forwarded straight to `tofu`/`terraform`:

```sh
export NUTANIX_USER="admin"
export NUTANIX_PASSWORD="<your password here>"
export NUTANIX_ENDPOINT="prism-central.example.com"
export NUTANIX_PORT="9440"

./tf.sh init
./tf.sh apply
```

> **Note:** `tf.sh` does not export `nutanix_insecure`; it relies on the
> example's default (`true`). Set `TF_VAR_nutanix_insecure=false` yourself if you
> need to verify TLS certificates.
