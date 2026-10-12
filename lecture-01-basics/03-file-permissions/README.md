# Lab 03 — File Permissions

```bash
printf '#!/usr/bin/env bash\necho "Permissions lab"\n' > demo.sh
ls -l demo.sh
bash demo.sh
./demo.sh
chmod u+x demo.sh
./demo.sh
chmod 755 demo.sh
chmod 644 demo.sh
ls -l demo.sh
```

- `r` = read, `w` = write, `x` = execute.
- `chmod u+x` adds execute permission for the owner.
- `755` means owner `rwx`, group `r-x`, others `r-x`.
- `644` means owner `rw-`, group `r--`, others `r--`.

After setting `644`, direct execution should fail, but `bash demo.sh` can still work if the file is readable.

**Exercise:** Set permissions so only the owner can read and write the file, then verify with `ls -l`.
