# Config files

## Getting started

### SSH keys
Generate SSH key
```
ssh-keygen -t ed25519 -C "your_email@example.com"
```
Copy it with
```
pbcopy < ~/.ssh/id_ed25519.pub
```
And add it to **Github > Settings > SSH and GPG Keys**

### Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Clone this repo

link environment
```
ln zsh/.zshenv ~/.zshenv
```
Disable SIP for yabai and sdk
Run brew bundle install
```
brew bundle install --file Brewbundle
```
### Install oh my zsh to .config folder
```
cd .config && sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install powerline fonts and theme
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

#theme
brew install pure
```
### copy the iterm profile.json to iterm > preferences > profile
download SF PRO https://developer.apple.com/fonts/

## Emacs
remove folder from home directory and link one from here to .config

## Run .macos script
