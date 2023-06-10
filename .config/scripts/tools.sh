#!/bin/bash

echo "Initializing The Tools Installation"

sudo apt-get update && sudo apt-get upgrade -y

echo"################################################################"

echo "-----Installing Neovim and Neovim Tools-----"

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update -y

sudo apt-get install neovim -y

sudo apt-get install python3-pip -y

sudo apt-get update -y

pip3 install pynvim

sudo apt-get install xclip -y
sudo apt-get install fd-find -y
sudo apt-get install ripgrep -y
sudo apt-get install universal-ctags -y

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "-----Neovim and Neovim Tools Instaled-----"

echo"################################################################"

echo "-----Installing System Tools-----"

sudo apt install trash-cli -y
sudo apt install tree -y
sudo apt install ncal -y
sudo apt install bat -y
sudo apt install exa -y
sudo apt install fzf -y
sudo apt install htop -y
sudo apt install tmux -y
sudo apt install neofetch -y
sudo apt install duf -y
sudo apt-get install ranger -y

echo "----System Tools Instaled----"

echo"################################################################"

echo "Installation Of The Tools Is complete"

echo "Restart Your Terminal Session Now and Enjoy :)"
