# Troubleshooting Guide

This guide covers common issues when installing and using ShellGPT on Kali Linux.

---

## 1. `sgpt: command not found`

### Cause
PATH does not include `~/.local/bin`.

### Fix

```bash
export PATH="$HOME/.local/bin:$PATH"
````

To make it permanent:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
```

---

## 2. API Error: `429 insufficient_quota`

### Error

```text
RateLimitError: insufficient_quota
```

### Cause

* No billing configured (OpenAI)
* No credits available
* Free ChatGPT account (no API access)

### Fix

Option 1 — Add OpenAI billing:

```text
https://platform.openai.com/billing
```

Option 2 — Use OpenRouter (recommended):

```bash
export OPENAI_API_KEY="your_openrouter_key"
export OPENAI_API_BASE="https://openrouter.ai/api/v1"
```

---

## 3. API Error: `401 Unauthorized`

### Cause

* Missing or invalid API key

### Fix

```bash
export OPENAI_API_KEY="your_api_key"
```

---

## 4. No response / hanging request

### Cause

* Missing `OPENAI_API_BASE` (for OpenRouter)
* Network issues

### Fix

```bash
export OPENAI_API_BASE="https://openrouter.ai/api/v1"
```

Check connectivity:

```bash
curl https://openrouter.ai
```

---

## 5. Broken APT repositories (`<!doctype html>` error)

### Error

```text
Type '<!doctype' is not known
```

### Cause

Invalid repository file containing HTML instead of repo URL.

### Fix (manual)

```bash
sudo find /etc/apt/sources.list.d -name "*.list" -exec grep -l "<!doctype html>" {} \; -exec sudo mv {} {}.disabled \;
sudo apt update
```

---

## 6. Python / pip issues

### Cause

* Broken Python environment
* Missing venv

### Fix

```bash
sudo apt install -y python3 python3-venv python3-pip
```

Re-run installer:

```bash
./scripts/shellgpt_kali_installer.sh
```

---

## 7. Permission issues (running script)

### Error

```text
Permission denied
```

### Fix

```bash
chmod +x scripts/shellgpt_kali_installer.sh
./scripts/shellgpt_kali_installer.sh
```

---

## 8. Running script as root

### Error

```text
Run this script as your normal user
```

### Cause

Script intentionally blocks root execution.

### Fix

Run as normal user:

```bash
./scripts/shellgpt_kali_installer.sh
```

---

## 9. Virtual environment issues

### Cause

* Corrupted venv
* Interrupted installation

### Fix

```bash
rm -rf ~/.local/share/shellgpt
./scripts/shellgpt_kali_installer.sh
```

---

## 10. Model-related errors

### Cause

* Unsupported model
* Wrong provider

### Fix

Try a supported model:

```bash
sgpt --model gpt-4o-mini "hello"
```

or with OpenRouter:

```bash
sgpt --model openrouter/openai/gpt-4o-mini "hello"
```

---

## 11. `sgpt` works but gives no output

### Cause

* API misconfiguration
* Incorrect environment variables

### Fix

Check variables:

```bash
echo $OPENAI_API_KEY
echo $OPENAI_API_BASE
```

---

## 12. Reset everything (quick fix)

```bash
rm -rf ~/.local/share/shellgpt
rm -rf ~/.config/shell_gpt
./scripts/shellgpt_kali_installer.sh
```

---

## Final Checklist

* `sgpt --help` works
* PATH is set correctly
* API key is configured
* API base is set (if using OpenRouter)
* `sgpt "hello"` returns a response

---
