# Lab 05 — Positional Parameters

Create `greet.sh`:

```bash
#!/usr/bin/env bash
printf 'Script: %s\n' "$0"
printf 'First argument: %s\n' "${1-}"
printf 'Second argument: %s\n' "${2-}"
printf 'Argument count: %s\n' "$#"
printf 'All arguments:'
printf ' <%s>' "$@"
printf '\n'
```

Run:

```bash
bash greet.sh "Mohamed" "DevOps Engineer"
```

A practical log checker:

```bash
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
```

**Exercise:** Extend the log checker to print a count and exit non-zero when no matches are found.
