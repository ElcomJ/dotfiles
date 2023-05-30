# 'zsh' config file

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme here
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins here
plugins=(git
	 zsh-autosuggestions
	 zsh-syntax-highlighting
	 asdf)

source $ZSH/oh-my-zsh.sh

. "$HOME/.asdf/asdf.sh"

# Comandos básicos

alias att='sudo apt-get update && sudo apt-get upgrade'
alias running_services='systemctl list-units  --type=service  --state=running'
alias cal='ncal -y'
alias bat='batcat'
alias v='nvim'
alias my_ip='hostname -I'

# Exa

alias exa1='exa --icons --group-directories-first'
alias exa2='exa --icons --group-directories-first -1'
alias exa3='exa --icons --group-directories-first -1 -a'
alias exa4='exa --icons --group-directories-first -1 -a -l -h'

# Tmux

alias tns='tmux new -s'
alias tas='tmux attach-session -t'
alias tls='tmux ls'
alias tks='tmux kill-session -t'

# Node

alias npm_user_packages='npm list -g --depth=0'

# C and C++

alias clang='clang-15'
alias clang++='clang++-15'
