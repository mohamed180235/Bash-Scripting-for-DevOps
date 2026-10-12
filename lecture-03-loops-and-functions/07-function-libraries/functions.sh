#!/usr/bin/env bash
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
