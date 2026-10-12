#!/usr/bin/env bash
set -euo pipefail

usage() { echo "Usage: $0 <source-directory> <backup-directory>" >&2; }
log_info() { printf '[INFO] %s\n' "$*"; }
log_error() { printf '[ERROR] %s\n' "$*" >&2; }

if (( $# != 2 )); then usage; exit 2; fi
source_dir=$1
backup_root=$2

if [[ ! -d "$source_dir" ]]; then
  log_error "Source directory does not exist: $source_dir"
  exit 1
fi

mkdir -p -- "$backup_root"
timestamp=$(date +%Y%m%d-%H%M%S)
destination="$backup_root/backup-$timestamp"

if [[ -e "$destination" ]]; then
  log_error "Destination already exists: $destination"
  exit 1
fi

cp -a -- "$source_dir" "$destination"
log_info "Backup created at $destination"
