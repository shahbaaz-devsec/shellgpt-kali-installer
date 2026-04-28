# Installation Guide

This guide explains how to install ShellGPT on Kali Linux using the automated installer.

---

## Step 1: Clone the repository

```bash
git clone https://github.com/shahbaaz-devsec/shellgpt-kali-installer.git
cd shellgpt-kali-installer
````

---

## Step 2: Make the installer executable

```bash
chmod +x scripts/shellgpt_kali_installer.sh
```

---

## Step 3: Run the installer

```bash
./scripts/shellgpt_kali_installer.sh
```

---

## What the installer does

The script automatically:

* Repairs broken Kali APT repositories
* Installs required dependencies:

  * Python 3
  * pip
  * venv
  * git
  * curl
* Creates an isolated Python virtual environment
* Installs ShellGPT (`shell-gpt`)
* Creates a global `sgpt` command
* Configures PATH for bash and zsh
* Prepares configuration directory

---

## Step 4: Activate PATH (if needed)

```bash
export PATH="$HOME/.local/bin:$PATH"
```

---

## Step 5: Verify installation

```bash
sgpt --help
```

You should see the ShellGPT help menu.

---

## Step 6: Configure API key

ShellGPT requires an OpenAI-compatible API key.

### Option 1 — OpenAI

```bash
export OPENAI_API_KEY="your_openai_api_key"
```

---

### Option 2 — OpenRouter (recommended)

```bash
export OPENAI_API_KEY="your_openrouter_api_key"
```

Then configure:

```bash
export OPENAI_API_BASE="https://openrouter.ai/api/v1"
```

---

## Step 7: Test ShellGPT

```bash
sgpt "hello"
```

---

## Expected Result

If everything is configured correctly, you should receive a response from the AI model.

---

## Important Notes

* The installer must be run as a normal user (not root)
* `sudo` is used internally when required
* A free ChatGPT account does not provide API access
* API usage may require billing or credits
* Always review generated shell commands before executing

---

## Verification Checklist

* `sgpt --help` works
* PATH includes `~/.local/bin`
* API key is set
* `sgpt "hello"` returns a response

---

````

---

## ✅ Commit message

```text
Add installation guide
````

---

## 🎯 What this does

* Matches your real working setup
* Includes API reality (no confusion)
* Covers OpenRouter (big upgrade)
* Prevents beginner mistakes

---
