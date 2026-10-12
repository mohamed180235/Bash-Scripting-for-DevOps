# Lab 08 — Server Health Checks

This lab combines functions, conditions, command substitution, and output formatting.

```bash
#!/usr/bin/env bash
set -u

log_info() { printf '[INFO] %s\n' "$*"; }
log_warn() { printf '[WARN] %s\n' "$*" >&2; }

check_disk() {
  local usage
  usage=$(df -P / | awk 'NR==2 {gsub(/%/, "", $5); print $5}')
  if [[ "$usage" =~ ^[0-9]+$ ]] && (( usage >= 80 )); then
    log_warn "Root filesystem usage is ${usage}%"
  else
    log_info "Root filesystem usage is ${usage:-unknown}%"
  fi
}

check_memory() {
  if command -v free >/dev/null 2>&1; then
    free -h
  else
    log_warn "'free' is not available on this system"
  fi
}

check_disk
check_memory
```

The threshold is an example; tune it for your environment. `df` output varies between operating systems, so validate the parser on the target OS.

**Exercise:** Add a check for a required command and a check for a directory used by an application.
