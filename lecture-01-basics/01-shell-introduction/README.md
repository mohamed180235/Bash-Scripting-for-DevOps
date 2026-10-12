# Lab 01 — Shell Introduction

Run these commands and compare the results:

```bash
echo "$SHELL"
echo "$0"
ps -p $$ -o comm=
cat /etc/shells
bash -c 'echo "Running under Bash"'
sh -c 'echo "Running under sh"'
getent passwd "$USER" 2>/dev/null || grep "^$USER:" /etc/passwd
```

- `$SHELL` usually describes your configured login shell.
- `$0` is the shell or script name in the current context.
- `$$` is the current shell process ID.
- `bash -c` and `sh -c` start a shell to execute the supplied command.

`zsh -c 'echo "Running under zsh"'` works only if zsh is installed.

**Exercise:** Write down the difference between your configured login shell and the shell currently running.
