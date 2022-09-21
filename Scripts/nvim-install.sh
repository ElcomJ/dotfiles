#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

source ~/.zshrc; clear

nvm install --lts

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update

sudo apt-get install neovim

echo "Neovim Installed !"
