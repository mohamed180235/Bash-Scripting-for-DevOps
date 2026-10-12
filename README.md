
# Bash Scripting for DevOps

Hands-on Bash labs for Linux and DevOps learners. The repository progresses from shell fundamentals to text processing, control flow, filesystem automation, functions, and practical operations scripts.

## Course roadmap

| Lecture | Topics | Final project |
|---|---|---|
| [Lecture 1 — Bash Basics](lecture-01-basics/README.md) | Shells, shebangs, permissions, variables, scope, user input | Linux information collector |
| [Lecture 2 — Control & Processing](lecture-02-control-and-processing/README.md) | stdin/stdout/stderr, redirection, grep/awk/sed, command substitution, conditionals, arguments, debugging | Log analyzer |
| [Lecture 3 — Loops & Functions](lecture-03-loops-and-functions/README.md) | for/while, globbing, reading files, functions, reusable libraries, automation | Project health report |

## Requirements

- Linux, macOS, or a Linux VM/WSL environment
- Bash 4+ recommended
- Standard utilities: `grep`, `awk`, `sed`, `find`, `sort`, `uniq`, `wc`, `date`, `hostname`
- Optional for specific labs: `curl`, `ping`, `systemctl`, `shellcheck`

> Some commands behave differently across Linux and macOS. Service-management demos use `systemctl` and are intended for Linux systems that use systemd.

## Clone and start

```bash
git clone https://github.com/<YOUR-USERNAME>/bash-scripting-for-devops.git
cd bash-scripting-for-devops
```

Read each lecture's README, then enter a lab directory and run the commands in order.

For executable scripts:

```bash
chmod +x script.sh
./script.sh
```

Or run explicitly with Bash:

```bash
bash script.sh
```

## Safe lab practices

- Run labs in a disposable directory, VM, or container where possible.
- Read commands before running them, especially `rm`, `cp`, and scripts that touch files.
- Never test destructive commands against important directories.
- Do not put passwords, tokens, or other secrets in scripts or Git.
- Scripts are teaching examples; review and adapt them before using them in production.

## Suggested learning workflow

1. Read the lab's `README.md`.
2. Run the demo script or commands.
3. Predict the output before running.
4. Complete the exercise without copying the solution first.
5. Explain what each important line does to a classmate.

## Repository conventions

Each lab contains a short guide and, where useful, runnable scripts and sample data. The `exercises/` directories are intentionally left for student work.
