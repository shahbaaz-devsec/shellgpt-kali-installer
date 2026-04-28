![Kali Linux](https://img.shields.io/badge/Kali-Linux-blue?logo=kalilinux)
![ShellGPT](https://img.shields.io/badge/ShellGPT-Terminal_AI-success)
![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Production--Ready-brightgreen)

# ShellGPT Kali Installer

Automated Kali Linux installer and setup guide for ShellGPT, a terminal-based AI assistant powered by OpenAI-compatible APIs.

---

## Overview

This project provides a clean and reproducible way to install ShellGPT on Kali Linux.

It handles:

- Kali APT source repair
- Python virtual environment setup
- ShellGPT installation
- Global `sgpt` command launcher
- Bash and zsh PATH configuration
- OpenAI API key configuration support
- Clean troubleshooting workflow

---

## Features

- Automated ShellGPT installation
- Isolated Python virtual environment
- Global `sgpt` launcher
- Kali Linux compatible
- Bash and zsh support
- Optional OpenAI API key setup
- OpenRouter-compatible configuration guidance

---

## Quick Start

```bash
git clone https://github.com/shahbaaz-devsec/shellgpt-kali-installer.git
cd shellgpt-kali-installer
chmod +x scripts/shellgpt_kali_installer.sh
./scripts/shellgpt_kali_installer.sh
````

---

## After Installation

Activate local user binaries:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Verify ShellGPT:

```bash
sgpt --help
```

Run a test prompt:

```bash
sgpt "hello"
```

---

## API Key Requirement

ShellGPT requires an API key from an OpenAI-compatible provider.

A free ChatGPT account does not automatically include OpenAI API credits.

You can use:

* OpenAI API
* OpenRouter
* Other OpenAI-compatible providers

---

## OpenAI Setup

```bash
export OPENAI_API_KEY="your_openai_api_key_here"
sgpt "hello"
```

---

## OpenRouter Setup

Use OpenRouter if you do not have OpenAI API billing enabled.

```bash
export OPENAI_API_KEY="your_openrouter_api_key_here"
```

Then configure ShellGPT to use:

```text
OPENAI_API_BASE=https://openrouter.ai/api/v1
```

See:

```text
docs/03-openrouter-setup.md
```

---

## Project Structure

```text
scripts/
  └── shellgpt_kali_installer.sh

docs/
  ├── 01-installation.md
  ├── 02-usage.md
  ├── 03-openrouter-setup.md
  ├── 04-troubleshooting.md
  └── 05-clean-reset.md
```

---

## Requirements

* Kali Linux rolling
* Internet connection
* Python 3
* API key from OpenAI or compatible provider

---

## Disclaimer

Use this project responsibly. ShellGPT can generate shell commands, so always review commands before running them.

---

## License

MIT License
```text
Add professional README
````

Commit it, then say `done`.
