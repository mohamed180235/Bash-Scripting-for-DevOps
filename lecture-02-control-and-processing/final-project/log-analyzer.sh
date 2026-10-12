#!/usr/bin/env bash
set -u
if (( $# != 2 )); then
  printf 'Usage: %s <log-file> <keyword>\n' "$0" >&2
  exit 2
fi
log_file=$1
keyword=$2
if [[ ! -f "$log_file" || ! -r "$log_file" ]]; then
  printf 'Error: file is missing or unreadable: %s\n' "$log_file" >&2
  exit 1
fi
matches=$(grep -nF -- "$keyword" "$log_file" || true)
count=$(printf '%s\n' "$matches" | grep -c . || true)
printf 'File: %s\nKeyword: %s\nMatches: %s\n' "$log_file" "$keyword" "$count"
if [[ -n "$matches" ]]; then
  printf '%s\n' "$matches"
fi
(( count > 0 ))
