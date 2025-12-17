# Path management configuration
# This file consolidates all PATH modifications for better maintainability
# Uses pathinsert/pathappend functions defined in dot_zshrc.tmpl

# Go paths
export GOPATH=$HOME/dev/golang
pathappend "$GOPATH/bin"
pathappend "$GOROOT/bin"

# RVM (Ruby Version Manager)
pathappend "$HOME/.rvm/bin"

# pnpm (standalone installation)
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Homebrew paths (HOMEBREW_PREFIX is set in dot_zshrc.tmpl)
pathinsert "$HOMEBREW_PREFIX/bin"
pathinsert "$HOMEBREW_PREFIX/sbin"
pathappend "$HOMEBREW_PREFIX/opt/go/libexec/bin"
pathinsert "$HOMEBREW_PREFIX/opt/python/libexec/bin"
pathinsert "$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin"
pathinsert "$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin"
pathinsert "$HOMEBREW_PREFIX/opt/gettext/bin"

# System Go installation
pathappend "/usr/local/go/libexec/bin"
pathinsert "/usr/local/go/bin"

# User local binaries
pathinsert "$HOME/.local/bin"
pathinsert "$HOME/bin"

# Tool-specific binaries
pathinsert "$HOME/bin/docker"
pathinsert "$HOME/bin/packer"
pathinsert "$HOME/bin/terraform"
pathinsert "$HOME/bin/google-cloud-sdk/bin"

# LM Studio CLI
pathappend "$HOME/.lmstudio/bin"
