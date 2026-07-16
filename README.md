# nutanix-terraform

Terraform/OpenTofu modules that I've created to support my Nutanix homelab running NKP
[NKP (Nutanix Kubernetes Platform)](https://www.nutanix.com/products/kubernetes-platform).

## Current modules

- [`nkp-rbac`](modules/nkp-rbac) -
provisions a Prism Central `nkp` user, NKP and CSI roles, and the authorization policies
that bind them. Useful to create a dedicated account for deploying NKP without falling back to using the `admin` account!
  - Module docs: [modules/nkp-rbac/README.md](modules/nkp-rbac/README.md)
- More to come!

## Getting started

The quickest way to see the module(s) in action is the
[`examples/`](examples/) directory, which includes a runnable configuration for each module I build. See individual examples
README (e.g. [examples/nkp-rbac/README.md](examples/nkp-rbac/README.md)) for connection details and usage of the `tf.sh`
wrapper.

To consume the modules from your own configuration, use something like:

```hcl
module "nkp" {
  source = "git::https://github.com/markround/nutanix-terraform.git//modules/nkp-rbac"
}
```

Or check the code out locally and import it from your own filesystem.

## Compatibility

These modules are tested only against:

- **NKP >= 2.18**
- **Prism Central >= 7.5**

Older versions will not work! I specifically target the v4 APIs used in current versions of PC and NKP.

## Requirements

| Name      | Version              |
| --------- | -------------------- |
| terraform | `>= 1.3.0`           |
| nutanix   | `>= 2.3.4, < 3.0.0`  |
| random    | `>= 3.5.0, < 4.0.0`  |
