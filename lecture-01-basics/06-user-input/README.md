# Lab 06 — User Input

```bash
#!/usr/bin/env bash
read -r -p "Enter your name: " name
read -r -p "Enter your environment (dev/test/prod): " environment
printf 'Hello %s; selected environment: %s\n' "$name" "$environment"
```

Other useful forms:

```bash
read -r -s -p "Enter a secret: " secret
printf '\nSecret received (not displaying it).\n'
```

`-r` prevents backslash interpretation; `-s` hides typed input in terminals. Do not print real secrets into logs.

**Exercise:** Ask for an application name and port, then display a summary. Validate that the port is not empty.
