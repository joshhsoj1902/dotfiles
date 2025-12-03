# Dotfiles

This repository contains dotfiles managed by [chezmoi](https://www.chezmoi.io/). All configuration files with the `dot_` prefix are chezmoi source templates that get installed to your home directory.

## Setup

### Quick Start

The easiest way to set up these dotfiles on a new machine:

```shell
# Clone the repository
git clone <repository-url> ~/dotfiles
cd ~/dotfiles

# Run the install script
./install.sh
```

The install script will:

1. Install chezmoi if it's not already installed
2. Initialize chezmoi with this repository as the source
3. Show you the next steps

### Manual Setup

If you prefer to set up manually:

```shell
# Install chezmoi (if not already installed)
sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$HOME/.local/bin"

# Initialize chezmoi with this repository
$HOME/.local/bin/chezmoi init --config-path ~/dotfiles

# Review what will be changed
$HOME/.local/bin/chezmoi diff

# Apply the dotfiles
$HOME/.local/bin/chezmoi apply
```

### After Initial Setup

Once chezmoi is initialized and applied, you can use it directly:

```shell
# Edit a dotfile
chezmoi edit ~/.zshrc

# See what would change
chezmoi diff

# Apply changes
chezmoi apply

# Update from repository
chezmoi update
```

## File Structure

### Main Configuration Files

- **`dot_zshrc.tmpl`** - Main zsh configuration file. Sources modular files from `~/.zsh/custom/`
- **`dot_bashrc.tmpl`** - Minimal bash configuration for server compatibility (auto-switches to zsh if available)
- **`dot_profile`** - Profile configuration for login shells
- **`dot_p10k.zsh`** - Powerlevel10k theme configuration
- **`dot_gitconfig.tmpl`** - Git configuration (uses chezmoi template variables)
- **`dot_gitignore`** - Global gitignore file

### Zsh Custom Configuration (`dot_zsh/custom/`)

The zsh configuration is modularized for better maintainability. The main `dot_zshrc.tmpl` file sources these modules in order:

1. **`paths.zsh`** - Path management (consolidates all PATH modifications)
2. **`oh-my-zsh.zsh`** - Oh My Zsh configuration (theme, plugins, etc.)
3. **`tools.zsh`** - Tool-specific completions (helm, kubectl, az, etc.)
4. **`functions.zsh`** - Custom zsh functions
5. **`aliases.zsh`** - Shell aliases
6. **`secrets.zsh.tmpl`** - Secrets and environment variables (template file, uses chezmoi variables)
7. **`powerlevel10k.zsh`** - Powerlevel10k theme loading (conditionally sourced - only on non-server systems)
8. **`brew.zsh`** - Homebrew initialization (conditionally sourced - only on non-RPI systems)
9. **`nvm.zsh`** - Node Version Manager (NVM) initialization

**Note**: All files in `dot_zsh/custom/` are installed by chezmoi, but some are only sourced conditionally based on template variables (see below).

### Chezmoi Template Variables

The following chezmoi variables are used for conditional configuration:

- **`.server`** - Set on server systems (disables powerlevel10k)
- **`.rpi`** - Set on Raspberry Pi systems (disables zsh auto-switch in bash, disables homebrew)
- **`.work`** - Set on work systems (enables work-specific secrets/config)
- **`.personal`** - Set on personal systems (enables personal-specific secrets/config)
- **`.docker`** - Set when Docker should be installed
- **`.gameserver`** - Set for game server configurations

## Other things to install

### Powerline10k fonts

[powerline10k fonts](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#fonts)

There should be details on how to install/enable the fonts for various platforms.

### noTunes

[noTunes](https://github.com/tombonez/noTunes)

Disable apple music from opening

```shell
brew install --cask notunes
```

### Slack

[Download](https://slack.com/downloads)

### Joplin

[Download](https://joplinapp.org/download/)

### 1password

[Desktop App](https://1password.com/downloads)

[Commit signing instructions](https://blog.1password.com/git-commit-signing/)

### Hot

[Hot](https://github.com/macmade/Hot)

MacOS menubar app for displaying CPU usage and temps.

### Rectangle

[Rectangle](https://rectangleapp.com/)

Better window management on MacOS.

## Settings

### Fix mac keyboard speed

[Superuser guide for increasing delete key speed](https://superuser.com/questions/677665/increase-the-speed-at-which-the-delete-key-deletes-things-on-osx)

finding the correct number to set this to is still WIP.

Honestly in the keyboard settings, setting the repeat rate and delay to one boop from the right most option is pretty good.

```shell
defaults write NSGlobalDomain KeyRepeat -int 2
```

### touchid sudo

[instructions](https://sixcolors.com/post/2023/08/in-macos-sonoma-touch-id-for-sudo-can-survive-updates/)

```shell
cd /etc/pam.d
sudo cp sudo_local.template sudo_local
sudo vim sudo_local
# Uncomment auth line
```

`sudo_local` is readonly and I had issues writing to it in iterm for some reason.
The built in terminal worked fine, that may have been a coincidence, I didn't try to replicate my issue once it worked.
