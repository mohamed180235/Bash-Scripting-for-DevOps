# Lab 05 — Read a File Line by Line

Create `servers.txt`:

```text
localhost
example.com
127.0.0.1
```

Read each line safely:

```bash
while IFS= read -r server || [[ -n "$server" ]]; do
  [[ -z "$server" ]] && continue
  printf 'Inventory entry: %s\n' "$server"
done < servers.txt
```

- `IFS=` preserves leading/trailing whitespace.
- `read -r` prevents backslashes from being interpreted.
- `|| [[ -n "$server" ]]` processes a final line without a newline.

**Exercise:** Read an inventory file and print a numbered list. Skip blank lines and comments starting with `#`.
