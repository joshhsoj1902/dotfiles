#!/bin/sh

set -e # -e: exit on error

# Determine the directory where this script is located
# This allows the script to work regardless of where it's run from
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

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

echo "NOTE: Use $bin_dir/chezmoi until the config has been applied"
echo ""

# Initialize chezmoi with the config file in this repository
# The config file (`.chezmoi.yaml.tmpl`) defines the source directory
$bin_dir/chezmoi init --config-path "$SCRIPT_DIR"

echo ""
echo "Initialization complete!"
echo ""
echo "Next steps:"
echo "  1. Review changes:  $bin_dir/chezmoi diff"
echo "  2. Apply changes:   $bin_dir/chezmoi apply"
echo "  3. After applying, you can use 'chezmoi' directly (no path needed)"