# Final Project — Project Health Report

## Scenario
You support a small application with `config/` and `logs/` directories. Build a script that validates the directories, inspects configuration files, counts errors across logs, checks disk usage, and prints a summary.

## Example directory layout

```text
project/
├── config/
│   ├── app.conf
│   └── database.conf
├── logs/
│   ├── app.log
│   └── worker.log
└── project-health.sh
```

## Starter implementation

```bash
#!/usr/bin/env bash
set -uo pipefail
shopt -s nullglob

log_info() { printf '[INFO] %s\n' "$*"; }
log_error() { printf '[ERROR] %s\n' "$*" >&2; }

check_directory() {
  [[ -d "$1" ]]
}

count_errors() {
  local file=$1
  grep -c 'ERROR' "$file" || true
}

check_disk() {
  df -P /
}

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
```

## Challenge extensions
- Accept the project directory as a positional argument.
- Add a warning threshold for disk usage.
- Write a timestamped report using `tee`.
- Add a function to validate each configuration file is readable.
- Add a `--help` option.
- Ensure the script handles spaces in paths.
