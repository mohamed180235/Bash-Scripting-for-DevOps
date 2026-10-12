# Lab 04 — Conditionals

```bash
read -r -p "Enter an integer: " number
if [[ "$number" =~ ^-?[0-9]+$ ]] && (( number >= 80 )); then
  echo "High value"
elif [[ "$number" =~ ^-?[0-9]+$ ]]; then
  echo "Value is below 80"
else
  echo "Please enter an integer"
fi
```

File checks:

```bash
[[ -f app.log ]] && echo "Regular file exists"
[[ -d /tmp ]] && echo "Directory exists"
[[ -r app.log ]] && echo "File is readable"
```

Command checks:

```bash
if command -v curl >/dev/null 2>&1; then
  echo "curl is installed"
fi
```

Service check on systemd Linux:

```bash
if systemctl is-active --quiet ssh; then
  echo "SSH service is active"
else
  echo "SSH service is not active"
fi
```

Use `case` for several named choices:

```bash
read -r -p "Environment (dev/test/prod): " environment
case "$environment" in
  dev)  echo "Using development settings" ;;
  test) echo "Using test settings" ;;
  prod) echo "Using production settings" ;;
  *)    echo "Unknown environment"; exit 1 ;;
esac
```

**Exercise:** Build a script that checks whether a supplied path is a file, directory, or missing path.
