# Lab 03 — Globbing (Dynamic Pattern Matching)

Common glob patterns:

| Pattern | Meaning |
|---|---|
| `*` | Any string, including empty |
| `?` | Exactly one character |
| `[abc]` | One character from the set |
| `[a-z]` | One character in the range |
| `*.log` | Names ending in `.log` |

Try:

```bash
printf '%s\n' *.log
printf '%s\n' 'app?.log'
printf '%s\n' app[1-3].log
```

The last two examples are patterns: if they do not match, Bash may leave the pattern unchanged unless options change that behavior.

Safer file processing:

```bash
shopt -s nullglob
for file in ./*.log; do
  [[ -f "$file" ]] || continue
  printf 'Processing %s\n' "$file"
done
```

Be careful with hidden files: `*` does not normally match names beginning with `.`. Do not run destructive commands until you have inspected the matched filenames.

**Exercise:** Select only `app1.log`, `app2.log`, and `app3.log` using a glob, then process each match.
