# Usage Guide

This guide explains how to use ShellGPT (`sgpt`) after installation.

---

## Step 1: Ensure PATH is set

If `sgpt` command is not found, run:

```bash
export PATH="$HOME/.local/bin:$PATH"
````

---

## Step 2: Verify installation

```bash
sgpt --help
```

If this works, ShellGPT is installed correctly.

---

## Step 3: Configure API key

ShellGPT requires an API key.

### Option 1 — OpenAI

```bash
export OPENAI_API_KEY="your_openai_api_key"
```

---

### Option 2 — OpenRouter (recommended)

```bash
export OPENAI_API_KEY="your_openrouter_api_key"
export OPENAI_API_BASE="https://openrouter.ai/api/v1"
```

---

## Step 4: Run basic prompt

```bash
sgpt "what is linux"
```

---

## Step 5: Useful usage modes

### Generate shell commands

```bash
sgpt --shell "list all listening ports"
```

---

### Describe shell commands

```bash
sgpt --describe-shell "nmap -sV 127.0.0.1"
```

---

### Generate code

```bash
sgpt --code "python script to scan open ports on localhost"
```

---

### Chat mode

```bash
sgpt --chat temp "explain networking basics"
```

---

### Start REPL session

```bash
sgpt --repl temp
```

---

## Step 6: Example workflows

### Example 1 — Linux help

```bash
sgpt "how to find large files in linux"
```

---

### Example 2 — Security usage

```bash
sgpt --shell "scan open ports on local machine using ss"
```

---

### Example 3 — Coding help

```bash
sgpt --code "bash script to monitor CPU usage"
```

---

## Step 7: Exit

If using REPL:

```bash
exit
```

---

## Important Notes

* ShellGPT requires an API key to function
* Free ChatGPT accounts do not include API access
* Always review generated shell commands before running
* Use in authorized environments only

---

## Common Mistakes

### Command not found

Fix:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

---

### API error (quota exceeded)

Cause:

* No billing or credits

Fix:

* Add billing OR use OpenRouter

---

### Running without API key

Error:

```text
401 / authentication error
```

Fix:

```bash
export OPENAI_API_KEY="your_key"
```

---

## Verification

Working setup should:

* Run `sgpt --help` successfully
* Accept prompts
* Return AI-generated responses

---
