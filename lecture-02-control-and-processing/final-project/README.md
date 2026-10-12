# Final Project — Log Analyzer

## Usage

```bash
bash log-analyzer.sh ../02-text-processing/app.log ERROR
```

The script validates arguments and input readability, counts matching lines, prints matches, and returns a useful status.

```bash
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
```

## Extension exercises
- Add a `-i` option for case-insensitive matching.
- Add a timestamp to the report.
- Save the report to a file using redirection or `tee`.
- Return distinct exit codes for invalid arguments, unreadable files, and no matches.
