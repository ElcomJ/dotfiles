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


If diffview fails to start because of diffview.log, use the command below to be able to create the file in the nvim cache:

Inside the home folder:

    - cd .cache/nvim | touch diffview.log

Keyboard mapping:

    - Inglês(EUA,intern., com teclas mortas)


Gnome Extensions:

    - Clipboard Indicator
    - No Titlebar When Maximized
    - OpenWeather
    - Transparent Top Bar
    - Rounded Window Corners
    - Emoji Selector


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
    - Google Chrome
    - OnlyOffice (flatpak)
    - Discord
    - Ubuntu Cleaner
    - gnome-tweaks
    - Firewall
    - Htop
    - Neofetch
    - Neovim
    - Dconf Editor
    - VSCode
    - DBeaver Community
    - Postman (opcional)
    - Synaptic


Core Softwares:

    - Git
    - Docker and Docker Compose
    - pip
    - Tmux
    - Ncspot add 104.199.240.237 ap-gue1.spotify.com in /etc/hosts
    - Rust + Cargo (https://www.journaldev.com/39960/install-rust-on-ubuntu-linux)
    - Gufw (firewall)
    - Flatpak Support
    - Gnome Store
    - live server (https://www.chiarulli.me/Neovim/20-live-server/)
    - gnome-sushi (sudo apt install gnome-sushi)
    - ranger
    - ueberzug (ranger image preview) - sudo apt install libxext-dev
    - trash-cli
