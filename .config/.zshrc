# 'zsh' config file

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Theme here
ZSH_THEME="simple"


# Plugins here
plugins=(git
	 zsh-autosuggestions
	 zsh-syntax-highlighting
	 asdf)

source $ZSH/oh-my-zsh.sh


. "$HOME/.asdf/asdf.sh"


# Comandos básicos

alias att='sudo apt-get update && sudo apt-get upgrade'

# Tmux

alias tas='tmux attach-session -t'
alias tls='tmux ls'
alias tks='tmux kill-session -t'
