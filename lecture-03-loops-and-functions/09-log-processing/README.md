# Lab 09 — Process Multiple Log Files

Create sample logs and count errors in each:

```bash
mkdir -p logs
printf 'INFO started\nERROR failed\n' > logs/app1.log
printf 'INFO ready\nWARN retry\nERROR timeout\n' > logs/app2.log
```

```bash
#!/usr/bin/env bash
set -u
shopt -s nullglob

count_errors() {
  local file=$1
  grep -c 'ERROR' "$file" || true
}

files=(logs/*.log)
if (( ${#files[@]} == 0 )); then
  echo "No log files found"
  exit 0
fi

for file in "${files[@]}"; do
  count=$(count_errors "$file")
  printf '%s: %s error line(s)\n' "$file" "$count"
done
```

**Exercise:** Add a total error count across all files and show only files with at least one error.
