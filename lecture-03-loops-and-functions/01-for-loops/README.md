# Lab 01 — Deterministic `for` Loops

Use `for` when the items or iteration range are known:

```bash
for i in 1 2 3 4 5; do
  echo "Iteration $i"
done

for i in {10..20..2}; do
  echo "$i"
done
```

Loop through a list:

```bash
servers=("web-01" "web-02" "api-01")
for server in "${servers[@]}"; do
  printf 'Checking %s\n' "$server"
done
```

**Exercise:** Loop through a list of services and print a check message for each one. Then modify it to count the total number of services.
