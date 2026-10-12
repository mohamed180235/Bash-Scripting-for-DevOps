# Lab 02 — Loops with Files

Create sample files:

```bash
mkdir -p demo-files
touch demo-files/app.log demo-files/audit.log demo-files/readme.txt
```

Loop over a glob, handling the case where no files match:

```bash
shopt -s nullglob
files=(demo-files/*.log)
if (( ${#files[@]} == 0 )); then
  echo "No log files found"
else
  for file in "${files[@]}"; do
    printf 'Found log file: %s\n' "$file"
  done
fi
```

Using an array avoids word-splitting filenames with spaces.

**Exercise:** Print the filename and size of each `.log` file in a directory.
