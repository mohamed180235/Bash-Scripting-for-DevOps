# Lab 01 — I/O Redirection

File descriptors: `0` stdin, `1` stdout, `2` stderr.

```bash
printf 'normal output\n'
printf 'error output\n' >&2
```

Redirect stdout:

```bash
ls -l > files.txt
ls -l >> files.txt
```

Redirect stderr and combine streams:

```bash
ls existing-file missing-file 2> errors.txt
ls existing-file missing-file > all-output.txt 2>&1
ls existing-file missing-file 2>&1 > stdout-only.txt
```

**Order matters:** redirections are processed left to right. In the last command, stderr is first connected to the current stdout, then stdout is redirected to the file; stderr therefore still goes to the original stdout.

Discard output:

```bash
command-that-may-fail >/dev/null 2>&1
```

View and save output with `tee`:

```bash
printf 'deployment started\n' | tee deployment.log
```

**Exercise:** Write stdout and stderr to separate files, then combine them into one file. Explain the redirection order.
