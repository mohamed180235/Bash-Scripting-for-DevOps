#!/usr/bin/env bash
set -uo pipefail
shopt -s nullglob

log_info() { printf '[INFO] %s\n' "$*"; }
log_error() { printf '[ERROR] %s\n' "$*" >&2; }

check_directory() { [[ -d "$1" ]]; }
count_errors() { grep -c 'ERROR' "$1" || true; }

check_disk() { df -P /; }

if ! check_directory config; then
  log_error "Missing config/ directory"
  exit 1
fi
if ! check_directory logs; then
  log_error "Missing logs/ directory"
  exit 1
fi

configs=(config/*.conf)
logs=(logs/*.log)
log_info "Configuration files found: ${#configs[@]}"
log_info "Log files found: ${#logs[@]}"

total_errors=0
for file in "${logs[@]}"; do
  count=$(count_errors "$file")
  printf '%s: %s error(s)\n' "$file" "$count"
  total_errors=$((total_errors + count))
done

printf 'Total ERROR lines: %s\n' "$total_errors"
log_info "Disk report:"
check_disk

if (( total_errors > 0 )); then
  log_error "Application logs contain errors"
  exit 1
fi
log_info "Project checks completed"
