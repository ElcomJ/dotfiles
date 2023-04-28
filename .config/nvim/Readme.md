## How to Install and Configure Neovim

  - Follow this [Guide](https://www.manualdocodigo.com.br/vim-basico/)
  - Install [asdf](https://asdf-vm.com/) for **NodeJs**
  - Install [vim-plug](https://github.com/junegunn/vim-plug) for **Neovim**
  - Install [xclip](https://howtoinstall.co/en/xclip) to use system clipboard
  - Copy **init.vim** and **coc-settings.json** from ~/.config/nvim/
  - Install [pip](https://www.educative.io/answers/installing-pip3-in-ubuntu) and install [pynvim](https://pypi.org/project/pynvim/)
  - Install [ripgrep](https://github.com/BurntSushi/ripgrep) for [telescope](https://github.com/nvim-telescope/telescope.nvim) extension
  - Open Neovim and run **PlugInstall**, before close and open again
  - Enjoy :)

## For C/C++

Install Clangd `bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"`<br />
alias clang='clang-15'<br />
alias clang++='clang++-15'<br />

`sudo apt install g++-12`<br />

Install Clang-format `sudo apt install clang-format`<br />
Remove Clang-format `sudo apt purge clang-format`

Add in **coc-settings.json** : `"clangd.path": "/usr/bin/clangd-15"`

## For Rust

  - Install [Rust](https://www.rust-lang.org/tools/install)

### Vista

  -  sudo apt-get install universal-ctags

### Vimspector

  - Run :VimspectorInstall
