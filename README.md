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
Run brew bundle install
```
brew bundle install --file Brewbundle
```
### Install oh my zsh
```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

