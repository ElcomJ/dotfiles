#!/bin/bash

sudo apt-get -y install flatpak
sudo apt-get -y install gnome-software-plugin-flatpak

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Flatpak Done !"
