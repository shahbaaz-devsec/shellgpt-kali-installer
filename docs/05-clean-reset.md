# Clean Reset Guide

Use this guide to completely remove ShellGPT from your system and start from a clean state.

---

## Step 1: Remove ShellGPT virtual environment

```bash
rm -rf ~/.local/share/shellgpt
````

---

## Step 2: Remove ShellGPT configuration

```bash
rm -rf ~/.config/shell_gpt
```

---

## Step 3: Remove global `sgpt` launcher

```bash
rm -f ~/.local/bin/sgpt
```

---

## Step 4: (Optional) Remove PATH entry

If you manually added PATH:

```bash
nano ~/.bashrc
nano ~/.zshrc
```

Remove this line if present:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

---

## Step 5: Reload shell

```bash
source ~/.bashrc
```

or

```bash
source ~/.zshrc
```

---

## Step 6: Verify removal

```bash
which sgpt || echo "sgpt not found"
```

Check directories:

```bash
ls -ld ~/.local/share/shellgpt ~/.config/shell_gpt 2>/dev/null || true
```

---

## Expected Result

After cleanup:

* `sgpt` command should not exist
* No ShellGPT directories remain
* System is ready for fresh installation

---

## Step 7: Reinstall (optional)

```bash
cd shellgpt-kali-installer
./scripts/shellgpt_kali_installer.sh
```

---

## Important Notes

* This does not remove system Python packages
* This only removes ShellGPT-specific files
* Safe to run multiple times

---
