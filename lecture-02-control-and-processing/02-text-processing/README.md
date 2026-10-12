# Lab 02 — Text Processing

Generate sample logs:

```bash
cat > app.log <<'EOF'
2026-10-12 INFO Application started
2026-10-12 ERROR Database connection failed
2026-10-12 WARN Retry scheduled
2026-10-12 ERROR Request timed out
2026-10-12 INFO Application recovered
EOF
```

Search and filter:

```bash
grep 'ERROR' app.log
grep -i 'error' app.log
grep -c 'ERROR' app.log
grep -v 'INFO' app.log
```

Pipelines pass one command's stdout to the next command's stdin:

```bash
grep 'ERROR' app.log | wc -l
```

`awk` works well with columns and conditions:

```bash
awk '{print $2}' app.log
awk '$2 == "ERROR" {print $0}' app.log
awk '$2 == "ERROR" {count++} END {print count+0}' app.log
```

`sed` can transform text:

```bash
sed 's/ERROR/CRITICAL/g' app.log
```

Count log levels:

```bash
awk '{count[$2]++} END {for (level in count) print level, count[level]}' app.log
```

**Exercise:** Create a sample web access log and use `awk` to print the client IP and HTTP status. Count requests with status `500`.
