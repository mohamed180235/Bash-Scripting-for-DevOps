# Lab 04 — Condition-Based `while` Loops

Use `while` when repetition depends on a condition:

```bash
counter=1
while (( counter <= 5 )); do
  echo "Counter: $counter"
  ((counter += 1))
done
```

Countdown:

```bash
count=5
while (( count > 0 )); do
  echo "$count"
  ((count -= 1))
done
echo "Go!"
```

Retry pattern (requires `curl`):

```bash
attempt=1
max_attempts=3
while (( attempt <= max_attempts )); do
  if curl --fail --silent --show-error --max-time 3 https://example.com >/dev/null; then
    echo "Endpoint is reachable"
    break
  fi
  echo "Attempt $attempt failed"
  ((attempt += 1))
done
```

For real automation, add an intentional delay between retries and choose a real endpoint you are authorized to test.

**Exercise:** Retry a command up to five times, stopping early when it succeeds. Print a final failure message if all attempts fail.
