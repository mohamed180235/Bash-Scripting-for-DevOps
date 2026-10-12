#!/usr/bin/env bash
set -u
if (( $# != 2 )); then
  echo "Usage: $0 <log-file> <keyword>" >&2
  exit 2
fi
log_file=$1
keyword=$2
if [[ ! -r "$log_file" ]]; then
  printf 'Cannot read file: %s\n' "$log_file" >&2
  exit 1
fi
grep -nF -- "$keyword" "$log_file"
