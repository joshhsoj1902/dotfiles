if [[ $(command -v thefuck) ]]; then
  eval $(thefuck --alias)
fi

alias grep='grep --color=auto'