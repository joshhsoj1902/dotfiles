# Tool-specific completions and configurations
# This file handles completions for various CLI tools

# Helm completion
# Fix for autocomplete from https://github.com/helm/helm/issues/5046#issuecomment-463576351
if [[ $(command -v helm) ]]; then
  source <(helm completion zsh 2>/dev/null | sed -E 's/\["(.+)"\]/\[\1\]/g' 2>/dev/null) 2>/dev/null || true
fi

# Azure CLI completion
if [[ $(command -v az) && -f "/usr/local/etc/bash_completion.d/az" ]]; then
  source /usr/local/etc/bash_completion.d/az
fi

# Kubernetes completion
if [[ $(command -v kubectl) ]]; then
  source <(kubectl completion zsh 2>/dev/null) 2>/dev/null || true
fi

# Additional zsh completions
if [[ -d "/usr/local/share/zsh-completions" ]]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# zsh-syntax-highlighting (if not installed via oh-my-zsh)
if [[ -d "/usr/local/share/zsh-syntax-highlighting" ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Allow watch command to support alias expansion (e.g. watch ll)
if [[ $(command -v watch) ]]; then
  alias watch='watch '
fi

