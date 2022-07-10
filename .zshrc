# 'zhs' config file

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Theme here
ZSH_THEME="spaceship"


# Plugins here
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions thefuck)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Comandos básicos

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias rm='rm -r'
alias home='cd ~'

# Aplicativos

