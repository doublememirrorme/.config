# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$XDG_CONFIG_HOME/oh-my-zsh

ZSH_THEME=""

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
	git
	brew
	common-aliases
	node
	npm
	rand-quote
	sudo
	yarn
	z
	colored-man-pages
	colorize
	cp
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

fpath+=("$(brew --prefix)/share/zsh/site-functions")

# oh-my-zsh overrides the prompt, so Pure must be activated after sourcing oh-my-zsh.sh
autoload -U promptinit; promptinit
prompt pure

export MANPATH=/usr/local/man:$MANPATH
export PATH="$PATH:~/Projects/flutter/bin"

export NVM_DIR=$XDG_CONFIG_HOME/nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias startmediaserver='docker-compose --file ~/Projects/emby/docker-compose.yml up --build -d'

eval "$(pyenv init --path)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$XDG_CONFIG_HOME/sdkman"
[[ -s "/Users/hcanadjija/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/hcanadjija/.sdkman/bin/sdkman-init.sh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/hcanadija/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/hcanadija/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/hcanadija/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/hcanadija/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

