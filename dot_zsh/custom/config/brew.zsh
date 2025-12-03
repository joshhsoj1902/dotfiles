# Homebrew initialization
# This file initializes Homebrew
# Note: This file is only sourced on non-RPI systems (controlled by template conditional in dot_zshrc.tmpl)

# Init brew
OS="$(uname)"
if [[ "${OS}" == "Linux" ]]; then
  if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 2>/dev/null || true
  fi
elif [[ "${OS}" == "Darwin" ]]; then
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || true
  fi
fi
