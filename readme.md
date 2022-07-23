Dotfiles

After upgrading the system, find the sources.list of the current ubuntu version and add it to the system.


How to install rtl8132eu-linx (usb wifi driver):

    - Run the command 'lsusb' in linux terminal
    - https://github.com/clnhub/rtl8192eu-linux

Sources.list ubuntu 22.04 LTS:

    - https://gist.github.com/ishad0w/2187a4eaab9273387645ac11905aca68

    echo "content" | sudo tee  /etc/apt/sources.list

    sudo apt-get update && sudo apt-get upgrade


To make neovim's TagBar work, install the universal ctags:

    - https://installati.one/ubuntu/22.04/universal-ctags/


How to install and configure zsh:

    - https://www.youtube.com/watch?v=5i3TpDR8muU


How to install and configure neovim:

    - https://www.youtube.com/watch?v=lm7y2hI6zME
    - https://www.manualdocodigo.com.br/vim-basico/


How to install Oracle Java:

    - https://www.linuxuprising.com/2021/09/how-to-install-oracle-java-17-lts-on.html


How to set the JAVA_HOME environment variable

    - https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04-pt


To use the neovim clipboard with your system you need to install xclip:

    - sudo apt-get install xclip


Gnome integration extension and extensions:

    - https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep?hl=pt-br
    - https://extensions.gnome.org/

Enable Insecured Mode on Ubuntu

Extensions:

    - Clipboard Indicator
    - No Titlebar When Maximized
    - OpenWeather
    - Transparent Top Bar


DConf Editor Config:

- /org/gnome/shell/extensions/dash-to-clock

    - click-action = 'minimize-or-previews'
    - background-opacity = 0.001
    - dash-max-icon-size = 24
    - dock-fixed = Dock always visible
    - dock-position = 'LEFT'
    - extend-height = 'VERDADEIRO'
    - transparency-mode - 'FIXED'


Install Programns:

    - Telegram Desktop
    - OnlyOffice (flatpak)
    - Discord
    - Ubuntu Cleaner
    - gnome-tweaks
    - Firewall
    - Gimp
    - Htop
    - Neofetch
    - Neovim
    - Dconf Editor
    - VSCode
    - DBeaver Community
    - Postman (opcional)


Core Softwares:

    - Git
    - pip
    - Tmux
    - Ncspot
    - Rust + Cargo (https://www.journaldev.com/39960/install-rust-on-ubuntu-linux)
    - Gufw (firewall)
    - Golang (opcional)
    - Flatpak and Flatpak Store
    - live server (https://www.chiarulli.me/Neovim/20-live-server/)
    - gnome-sushi (sudo apt install gnome-sushi)
    - mysql server
    - postgresql