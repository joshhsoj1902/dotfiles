#!/bin/sh

set -e # -e: exit on error

bin_dir="$HOME/.local/bin"
if [ ! "$(command -v chezmoi)" ]; then
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
fi

echo "NOTE"
echo "Use $bin_dir/chezmoi until the config has been applied"
echo ""

$bin_dir/chezmoi init --source $HOME/dotfiles

echo "Done, diff & apply can now be ran"