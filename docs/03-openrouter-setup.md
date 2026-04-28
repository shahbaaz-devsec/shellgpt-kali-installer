# OpenRouter Setup Guide

This guide explains how to configure ShellGPT to use OpenRouter as an alternative to OpenAI.

---

## Why OpenRouter?

OpenRouter provides access to multiple AI models using a single API key.

Benefits:

- Lower cost compared to OpenAI
- Access to multiple models
- Works without OpenAI billing in some cases
- Compatible with ShellGPT

---

## Step 1: Create OpenRouter account

Go to:

```text
https://openrouter.ai
````

Sign up and log in.

---

## Step 2: Generate API key

Go to:

```text
https://openrouter.ai/keys
```

Click:

```text
Create Key
```

Copy your API key.

---

## Step 3: Set environment variables

Run:

```bash
export OPENAI_API_KEY="your_openrouter_api_key"
export OPENAI_API_BASE="https://openrouter.ai/api/v1"
```

---

## Step 4: (Optional) Set default model

You can define a default model using ShellGPT config.

Edit config file:

```bash
nano ~/.config/shell_gpt/.sgptrc
```

Add:

```text
DEFAULT_MODEL=openrouter/openai/gpt-4o-mini
```

---

## Step 5: Test configuration

Run:

```bash
sgpt "hello"
```

---

## Expected Result

You should receive a valid response from the model.

---

## Recommended Models

You can use different models via OpenRouter.

Examples:

```bash
sgpt --model openrouter/openai/gpt-4o-mini "hello"
sgpt --model openrouter/mistralai/mistral-7b-instruct "explain linux"
```

---

## Verify current model

```bash
sgpt --help
```

or run:

```bash
sgpt "what model are you using?"
```

---

## Common Errors

### Error: quota exceeded

Cause:

* No credits in OpenRouter account

Fix:

* Add credits in OpenRouter dashboard

---

### Error: invalid API key

Cause:

* Wrong or expired key

Fix:

* Regenerate API key

---

### No response / hangs

Cause:

* Missing API base

Fix:

```bash
export OPENAI_API_BASE="https://openrouter.ai/api/v1"
```

---

## Important Notes

* OpenRouter uses OpenAI-compatible API format
* ShellGPT works without modification using environment variables
* Always verify commands before executing
* Use authorized environments only

---

## Verification Checklist

* API key is set
* API base is set
* Model is configured (optional)
* `sgpt "hello"` returns a response

---

👉 `docs/04-troubleshooting.md` (advanced + real-world errors you already hit)
