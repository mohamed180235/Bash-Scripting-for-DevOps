# Lab 10 — Backup Automation

Usage:

```bash
bash backup.sh <source-directory> <backup-directory>
```

The script below copies the source directory into a timestamped destination. It validates arguments and avoids silently overwriting an existing timestamped destination.

```bash
#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <source-directory> <backup-directory>" >&2
}
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
```

**Important:** This is a learning demo, not a complete backup strategy. Production backups need retention, monitoring, restore tests, storage planning, and potentially encryption.

**Exercise:** Add a check that the source contains files, and document how you would implement a retention policy safely.
