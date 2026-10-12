# Lab 07 — Reusable Function Libraries

Create `functions.sh`:

```bash
log_info() {
  printf '[INFO] %s\n' "$*"
}
log_error() {
  printf '[ERROR] %s\n' "$*" >&2
}
check_file() {
  [[ -f "$1" && -r "$1" ]]
}
check_command() {
  command -v "$1" >/dev/null 2>&1
}
```

Load it from another script:

```bash
#!/usr/bin/env bash
source ./functions.sh
log_info "Starting validation"
if check_file /etc/hosts; then
  log_info "/etc/hosts is readable"
else
  log_error "Cannot read /etc/hosts"
fi
```

`source` runs the library in the current shell, so its functions and variables become available to the caller.

**Exercise:** Add `require_command()` that exits with a clear error if a required command is missing.
