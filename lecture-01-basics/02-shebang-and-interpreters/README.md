# Lab 02 — Shebang and Interpreters

Create `hello.sh`:

```bash
#!/usr/bin/env bash
name="DevOps Student"
printf 'Hello, %s\n' "$name"
```

Run it in two ways:

```bash
bash hello.sh
chmod +x hello.sh
./hello.sh
```

The shebang selects the interpreter when executing the file directly. Explicitly running `bash hello.sh` invokes Bash regardless of the shebang.

Compare Bash-specific syntax with `sh`:

```bash
#!/usr/bin/env bash
if [[ -n "${USER:-}" ]]; then
  echo "USER is set"
fi
```

**Exercise:** Change the shebang to `#!/bin/sh`, run it with `sh`, and explain why Bash-specific constructs may fail under other shells.
