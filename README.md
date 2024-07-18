# Setup

Initial setup looks something like this

```shell
❯ chezmoi init --config-path /Users/joshbryans/dotfiles
```

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

[link](https://superuser.com/questions/677665/increase-the-speed-at-which-the-delete-key-deletes-things-on-osx)

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
