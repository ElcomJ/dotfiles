#!/bin/bash

sudo apt-get update && sudo apt-get upgrade

echo "deb http://archive.ubuntu.com/ubuntu/ jammy main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse
deb http://archive.canonical.com/ubuntu jammy partner

deb https://ppa.launchpadcontent.net/neovim-ppa/unstable/ubuntu impish main" | sudo tee  /etc/apt/sources.list

sudo apt-get update && sudo apt-get upgrade

sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:atareao/telegram
sudo add-apt-repository ppa:gerardpuig/ppa

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
