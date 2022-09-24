#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:atareao/telegram
sudo add-apt-repository ppa:gerardpuig/ppa

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get -y install software-properties-common
sudo apt-get -y install python-setuptools
sudo apt-get -y install python3-pip
sudo apt-get -y install tmux
sudo apt-get -y install ranger
sudo apt-get -y install gufw
sudo apt-get -y install telegram
sudo apt-get -y install ubuntu-cleaner
sudo apt-get -y install gnome-tweaks
sudo apt-get -y install dconf-editor
sudo apt-get -y install neofetch

pip install trash-cli

echo "Pos Install Done !"
