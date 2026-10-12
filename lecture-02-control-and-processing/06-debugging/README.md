# Lab 06 — Debugging and Safer Bash

Trace a script:

```bash
bash -x ./script.sh
```

Trace selected sections:

```bash
set -x
some_command
set +x
```

Inspect exit status:

```bash
false
echo "$?"
true
echo "$?"
```

Safer options:

```bash
set -euo pipefail
```

- `-e`: exit on many unhandled command failures (with important exceptions).
- `-u`: treat unset variables as errors.
- `pipefail`: a pipeline fails if a command in it fails, not only when the last command fails.

These options are useful, but they are not a substitute for deliberate error handling. Test scripts against expected failure cases.

Install ShellCheck if available, then run:

```bash
shellcheck ./script.sh
```

**Exercise:** Add argument validation to a script, run it with missing arguments, and make sure it prints usage to stderr with a non-zero exit status.
