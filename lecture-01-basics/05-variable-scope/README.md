# Lab 05 — Variable Scope and Export

Create `child.sh`:

```bash
#!/usr/bin/env bash
printf 'Child sees APP_ENV=%s\n' "${APP_ENV-unset}"
```

Create `parent.sh`:

```bash
#!/usr/bin/env bash
APP_ENV="development"
echo "Parent: $APP_ENV"
bash ./child.sh
export APP_ENV
bash ./child.sh
```

Run:

```bash
chmod +x parent.sh child.sh
./parent.sh
```

The child process does not automatically inherit ordinary shell variables. `export` places the variable in the environment passed to child processes.

**Exercise:** Export `REGION` and confirm that a child script can read it. Then `unset REGION` and test again.
