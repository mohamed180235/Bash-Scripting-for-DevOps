# Final Project — Linux Information Collector

## Objective
Create a script that gathers basic information about the machine and optionally labels the report with a user-provided environment.

## Starter script

```bash
#!/usr/bin/env bash
set -u
read -r -p "Environment name: " environment
printf '%s\n' "=== Linux Information ==="
printf 'Environment: %s\n' "$environment"
printf 'User: %s\n' "$(whoami)"
printf 'Hostname: %s\n' "$(hostname)"
printf 'Date: %s\n' "$(date)"
printf 'Kernel: %s\n' "$(uname -r)"
```

Run with `bash linux-info.sh`.

## Extension exercises
- Save the report to a file.
- Add a timestamp to the report filename.
- Check whether required commands exist before using them.
- Return a non-zero exit code if the environment name is empty.
