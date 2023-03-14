## For C/C++

Install Clangd `bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"`<br />
alias clang='clang-15'<br />
alias clang++='clang++-15'<br />

`sudo apt install g++-12`<br />

Install Clang-format `sudo apt install clang-format`<br />
Remove Clang-format `sudo apt purge clang-format`

Add in <b>coc-settings.json<b/> : `"clangd.path": "/usr/bin/clangd-15"`

## For Rust

### Tagbar

  -  sudo apt-get install universal-ctags
  -  Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}

### Vimspector

  - Run :VimspectorInstall
