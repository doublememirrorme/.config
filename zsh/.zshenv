export PATH=/opt/homebrew/sbin:/opt/homebrew/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSHZ_DATA=$ZDOTDIR/.z
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

# Load private environment variables (tokens, keys, etc.)
[ -f "$ZDOTDIR/.zshenv.private" ] && source "$ZDOTDIR/.zshenv.private"

export NVM_DIR="$XDG_CONFIG_HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
. "$HOME/.cargo/env"
