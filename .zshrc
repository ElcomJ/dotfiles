# 'zhs' config file

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Theme here
ZSH_THEME="spaceship"


# Plugins here
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Comandos básicos

alias att='sudo apt-get update && sudo apt-get upgrade'


alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias rmr='rm -r'
alias here='pwd'
alias home='cd ~'
alias w='whoami; who'


# Aplicativos

alias chrome='google-chrome'
alias files='nautilus'
alias code='code .'


# Tmux

alias tas='tmux attach-session -t'
alias tls='tmux ls'
alias tns='tmux new-session'
alias tks='tmux kill-session -t'


# Docker

alias dcon='docker container ls -a'
alias dimg='docker images'
alias dvol='docker volume ls'
alias dps='docker ps'
alias dstart='docker start'
alias dstop='docker stop'
alias dexec='docker exec -it'


# Scripts

alias tdev='cd ~/Documentos/ ; sh tmux-dev.sh'
