#!/usr/bin/env bash
set -u
read -r -p "Environment name: " environment
if [[ -z "$environment" ]]; then
  printf 'Environment cannot be empty.\n' >&2
  exit 1
fi
printf '%s\n' "=== Linux Information ==="
printf 'Environment: %s\n' "$environment"
printf 'User: %s\n' "$(whoami)"
printf 'Hostname: %s\n' "$(hostname)"
printf 'Date: %s\n' "$(date)"
printf 'Kernel: %s\n' "$(uname -r)"
