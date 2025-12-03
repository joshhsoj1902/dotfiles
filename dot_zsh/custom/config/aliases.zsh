# Lazy-load thefuck to avoid slow startup
# Define a wrapper function instead of using thefuck --alias
if command -v thefuck &> /dev/null; then
  fuck () {
    command thefuck "$@"
  }
fi

alias grep='grep --color=auto'