# Lab 04 — Variables

```bash
course="Bash Scripting"
student="Learner"
printf 'Course: %s\nStudent: %s\n' "$course" "$student"
printf 'Current user: %s\n' "$USER"
printf 'Current directory: %s\n' "$PWD"
printf 'Script name: %s\n' "$0"
```

Assignment has no spaces around `=`:

```bash
count=3
```

Quote variable expansions to preserve spaces:

```bash
folder="my project"
mkdir -p "$folder"
```

Avoid naming variables after important commands, such as `PATH`, `HOME`, or `PWD`.

**Exercise:** Create variables for an application name, environment, and version, then print a deployment summary.
