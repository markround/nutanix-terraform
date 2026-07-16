#!/usr/bin/env bash
set -e

export TF_VAR_nutanix_username="$NUTANIX_USER"
export TF_VAR_nutanix_password="$NUTANIX_PASSWORD"
export TF_VAR_nutanix_endpoint="$NUTANIX_ENDPOINT"
export TF_VAR_nutanix_port="$NUTANIX_PORT"

if command -v tofu >/dev/null 2>&1; then
  tf_bin="tofu"
elif command -v terraform >/dev/null 2>&1; then
  tf_bin="terraform"
else
  echo "Warning: neither 'tofu' nor 'terraform' was found on your PATH." >&2
  exit 1
fi

"$tf_bin" "$@"
