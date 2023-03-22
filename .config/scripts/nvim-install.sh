#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

source ~/.zshrc; clear

nvm install --lts

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get -y update

sudo apt-get -y install neovim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

sudo apt-get -y install universal-ctags
sudo apt-get -y install xclip
sudo apt-get -y install ripgrep
sudo apt-get -y install fd-find

echo "Neovim Installed !"