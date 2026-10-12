# Lab 00 — Environment Setup

Check that Bash is available:

```bash
bash --version
command -v bash
pwd
mkdir -p ~/bash-course/lab01
cd ~/bash-course/lab01
```

Create and run a first script:

```bash
cat > hello.sh <<'EOF'
#!/usr/bin/env bash
echo "Hello from Bash"
EOF
chmod +x hello.sh
./hello.sh
```

**Expected output:** `Hello from Bash`

**Exercise:** Create a directory for each lecture and confirm your current directory with `pwd`.
