# Lab 06 — Functions

Functions group reusable behavior:

```bash
greet() {
  echo "Hello, DevOps learner"
}
greet
```

Arguments and local variables:

```bash
greet_user() {
  local name=$1
  printf 'Hello, %s\n' "$name"
}
greet_user "Mohamed"
```

Return status vs returned output:

```bash
is_readable() {
  [[ -r "$1" ]]
}
if is_readable "/etc/hosts"; then
  echo "File is readable"
fi

get_hostname() {
  hostname
}
host=$(get_hostname)
echo "$host"
```

A function's `return` status is an exit status (0–255), not a general string result. Use stdout to return text.

**Exercise:** Write `is_port_valid()` that returns success for a numeric port from 1 to 65535.
