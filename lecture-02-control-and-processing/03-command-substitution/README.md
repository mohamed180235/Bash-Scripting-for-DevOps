# Lab 03 — Command Substitution

Command substitution captures a command's stdout:

```bash
current_user=$(whoami)
host_name=$(hostname)
kernel_version=$(uname -r)
printf 'User=%s Host=%s Kernel=%s\n' "$current_user" "$host_name" "$kernel_version"
```

Capture a count:

```bash
error_count=$(grep -c 'ERROR' app.log)
printf 'Errors found: %s\n' "$error_count"
```

Use the result in a condition:

```bash
if [[ "$error_count" -gt 0 ]]; then
  echo "Investigate application errors"
else
  echo "No errors found"
fi
```

Prefer `$(...)` over legacy backticks because it is easier to read and nest.

**Exercise:** Capture disk usage from `df`, print it, and report if the root filesystem exceeds a threshold. Keep the threshold comparison robust for the output format on your system.
