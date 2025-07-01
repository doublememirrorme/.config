# 🏠 Dotfiles

A comprehensive macOS development environment setup with secure configuration management.

## 🚀 Quick Start

### Prerequisites

1. **Generate SSH Key**
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   pbcopy < ~/.ssh/id_ed25519.pub
   ```
   Add the public key to **GitHub > Settings > SSH and GPG Keys**

2. **Install Homebrew**
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. **Clone This Repository**
   ```bash
   git clone git@github.com:hcanadija/dotfiles.git ~/.config/dotfiles
   cd ~/.config/dotfiles
   ```

### Installation

1. **Link Environment Configuration**
   ```bash
   ln -sf ~/.config/dotfiles/zsh/.zshenv ~/.zshenv
   ```

2. **Create Private Environment File**
   ```bash
   cp zsh/.zshenv.private.example zsh/.zshenv.private
   # Edit zsh/.zshenv.private with your actual tokens
   ```

3. **Install Homebrew Packages**
   ```bash
   brew bundle install
   ```

4. **Install Oh My Zsh**
   ```bash
   cd ~/.config && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

5. **Install Pure Theme**
   ```bash
   brew install pure
   ```

6. **Install Powerline Fonts**
   ```bash
   git clone https://github.com/powerline/fonts.git --depth=1
   cd fonts && ./install.sh
   cd .. && rm -rf fonts
   ```

7. **Configure System Preferences**
   ```bash
   ./.macos
   ```

8. **Start Services**
   ```bash
   yabai --start-service
   skhd --start-service
   ```

## 🛠 Components

### Shell (ZSH)
- **Location**: `zsh/`
- **Features**: 
  - Oh My Zsh with custom plugins
  - Pure prompt theme
  - XDG Base Directory compliance
  - Secure environment variable management
  - Auto-suggestions and syntax highlighting

**Key Files:**
- `.zshenv` - Environment variables and PATH setup
- `.zshrc` - Interactive shell configuration
- `.zshenv.private` - Secure token storage (gitignored)

### Window Management
- **Yabai**: Tiling window manager
- **skhd**: Hotkey daemon for window control
- **Configuration**: `yabai/yabairc`, `skhd/skhdrc`

**Key Shortcuts:**
- `Alt + hjkl` - Focus windows
- `Shift + Alt + hjkl` - Swap windows
- `Alt + t` - Toggle window split
- `Alt + f` - Toggle fullscreen
- `Alt + u` - Toggle float

### Package Management
- **Homebrew Bundle**: `Brewfile`
- **Includes**: Development tools, GUI applications, fonts, VSCode extensions

**Key Tools:**
- Development: git, node (via nvm), python (via pyenv), docker
- CLI Tools: ripgrep, jq, htop, tree, tmux
- GUI Apps: Cursor, Docker Desktop, Firefox, Steam
- Media: ffmpeg, youtube-dl, imagemagick

### Security & Privacy

#### 🔒 Secure Token Management
This setup uses a secure approach for managing sensitive environment variables:

- **Public Config**: `zsh/.zshenv` (tracked in git)
- **Private Config**: `zsh/.zshenv.private` (gitignored)
- **Auto-loading**: Private config is automatically sourced if it exists

**To add sensitive tokens:**
1. Create `zsh/.zshenv.private`
2. Add your tokens: `export API_TOKEN="your_token_here"`
3. The file is automatically ignored by git

#### Current Private Variables
- `HOMEBREW_GITHUB_API_TOKEN` - GitHub API token for Homebrew

### XDG Base Directory Compliance
This setup follows XDG Base Directory specification:
- `XDG_CONFIG_HOME`: `~/.config`
- `ZDOTDIR`: `~/.config/zsh`
- Configurations stored in appropriate XDG directories

## 📁 File Structure

```
dotfiles/
├── README.md                 # This file
├── .gitignore               # Git ignore patterns
├── .macos                   # macOS system preferences
├── Brewfile                 # Homebrew bundle
├── Brewfile.lock.json       # Locked package versions
├── zsh/
│   ├── .zshenv             # Environment variables (public)
│   ├── .zshenv.private     # Secure tokens (gitignored)
│   └── .zshrc              # ZSH configuration
├── yabai/
│   └── yabairc             # Window manager config
└── skhd/
    └── skhdrc              # Hotkey configuration
```

## 🔧 Customization

### Adding New Tools
1. Add to `Brewfile`: `brew "tool-name"`
2. Run: `brew bundle install`
3. Update this README if significant

### Adding Environment Variables
- **Public**: Add to `zsh/.zshenv`
- **Private/Sensitive**: Add to `zsh/.zshenv.private`

### Window Management
- Edit `yabai/yabairc` for window behavior
- Edit `skhd/skhdrc` for keyboard shortcuts

## 🚨 Important Notes

### Security
- ⚠️ **Never commit sensitive tokens to git**
- ✅ Use `zsh/.zshenv.private` for API keys, passwords, etc.
- ✅ The private file is automatically gitignored

### System Requirements
- macOS (tested on macOS Ventura+)
- Homebrew
- Git
- Disable SIP (System Integrity Protection) for yabai full functionality

### Services
Some features require running services:
```bash
# Start window management
brew services start yabai
brew services start skhd

# Check status
brew services list | grep -E "(yabai|skhd)"
```

## 🔍 Troubleshooting

### Window Management Not Working
1. Check SIP status: `csrutil status`
2. Restart services: `brew services restart yabai skhd`
3. Check logs: `tail -f /usr/local/var/log/yabai/yabai.err.log`

### Environment Variables Not Loading
1. Verify file exists: `ls -la zsh/.zshenv.private`
2. Check syntax: `source zsh/.zshenv.private`
3. Restart terminal

### Homebrew Issues
1. Update bundle: `brew bundle dump --force`
2. Clean up: `brew bundle cleanup`
3. Check outdated: `brew outdated`

## 📝 Additional Setup

### iTerm2 Profile
- Import profile from repository (if available)
- Use SF Pro font family
- Enable Pure theme integration

### VSCode Extensions
Automatically installed via Brewfile:
- GitHub Copilot
- GitLens
- Docker
- Vim keybindings
- Custom themes

### Fonts
- Powerline fonts for terminal
- SF Pro for system-wide consistency
- Fira Code for coding (with ligatures)

---

**💡 Pro Tip**: Keep your `zsh/.zshenv.private` file backed up securely but separately from this repository!
