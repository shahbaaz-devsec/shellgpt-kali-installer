#!/usr/bin/env bash
set -Eeuo pipefail

APP_NAME="shell-gpt"
VENV_DIR="${HOME}/.local/share/shellgpt/venv"
BIN_DIR="${HOME}/.local/bin"
CONFIG_DIR="${HOME}/.config/shell_gpt"
CONFIG_FILE="${CONFIG_DIR}/.sgptrc"
BASH_RC="${HOME}/.bashrc"
ZSH_RC="${HOME}/.zshrc"

if [[ "${EUID}" -eq 0 ]]; then
  echo "Run this script as your normal user, not root."
  exit 1
fi

sudo -v

sudo find /etc/apt/sources.list.d -maxdepth 1 -type f -name "*.list" -exec grep -qiE '^\s*<!doctype html>|^\s*<html' {} \; -exec sudo mv {} {}.disabled \; 2>/dev/null || true

printf '%s\n' "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list >/dev/null

sudo apt clean
sudo rm -rf /var/lib/apt/lists/*
sudo apt update
sudo apt install -y python3 python3-venv python3-pip pipx curl ca-certificates git

mkdir -p "${BIN_DIR}"
mkdir -p "${CONFIG_DIR}"

python3 -m venv "${VENV_DIR}"

"${VENV_DIR}/bin/python" -m pip install --upgrade pip setuptools wheel
"${VENV_DIR}/bin/python" -m pip install --upgrade shell-gpt

cat > "${BIN_DIR}/sgpt" <<EOF
#!/usr/bin/env bash
exec "${VENV_DIR}/bin/sgpt" "\$@"
EOF

chmod +x "${BIN_DIR}/sgpt"

grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' "${BASH_RC}" 2>/dev/null || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "${BASH_RC}"
grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' "${ZSH_RC}" 2>/dev/null || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "${ZSH_RC}"

export PATH="${HOME}/.local/bin:${PATH}"

if [[ -n "${OPENAI_API_KEY:-}" ]]; then
  touch "${CONFIG_FILE}"

  if grep -q '^OPENAI_API_KEY=' "${CONFIG_FILE}" 2>/dev/null; then
    sed -i "s|^OPENAI_API_KEY=.*|OPENAI_API_KEY=${OPENAI_API_KEY}|" "${CONFIG_FILE}"
  else
    printf '%s\n' "OPENAI_API_KEY=${OPENAI_API_KEY}" >> "${CONFIG_FILE}"
  fi

  if ! grep -q '^DEFAULT_MODEL=' "${CONFIG_FILE}" 2>/dev/null; then
    printf '%s\n' "DEFAULT_MODEL=gpt-4o-mini" >> "${CONFIG_FILE}"
  fi

  chmod 600 "${CONFIG_FILE}"
fi

if ! command -v sgpt >/dev/null 2>&1; then
  echo "sgpt was installed, but ~/.local/bin is not active in this shell yet."
  echo "Run: export PATH=\"\$HOME/.local/bin:\$PATH\""
  exit 1
fi

sgpt --version || true

cat <<EOF

ShellGPT installation complete.

Run:

export PATH="\$HOME/.local/bin:\$PATH"
sgpt --help

If you did not set OPENAI_API_KEY before running the installer, configure ShellGPT by running:

sgpt "hello"

or manually edit:

${CONFIG_FILE}

Example usage:

sgpt "Explain what DNS is"
sgpt --shell "list all open ports using ss"
sgpt --code "write a Python port scanner for localhost only"

EOF
