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
And add it to **Github > Settings > SSH and GPG Keys**

### Clone this repo

link environment
```
ln zsh/.zshenv ~/.zshenv
```
