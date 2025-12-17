# Chezmoi updates notification
# Fast, non-blocking check for pending dotfiles updates
# Completely inert during sourcing - only defines function

# Define function only - no execution, no hooks, no arrays during sourcing
_chezmoi_show_notification() {
    # Only run in interactive shells
    [[ -n "$PS1" ]] || [[ -o interactive ]] || return

    local STATUS_FILE="${XDG_CACHE_HOME:-$HOME/.cache}/chezmoi-updates-available"
    [[ -f "$STATUS_FILE" ]] || return

    # Display colored notification message
    echo -e "\033[1;33m📦\033[0m \033[1mDotfiles updates available.\033[0m Run: \033[1;36mchezmoi diff\033[0m"

    # Remove from precmd so it only runs once
    # Use precmd_functions array directly to avoid autoload
    precmd_functions=(${precmd_functions[@]/_chezmoi_show_notification})
}

# Register function to run on first prompt (after instant prompt)
# Use precmd_functions array - this is the minimal way that avoids all autoload/hook calls
(( ${+precmd_functions} )) || typeset -a precmd_functions
precmd_functions+=(_chezmoi_show_notification)

