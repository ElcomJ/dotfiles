let mapleader = "\<Space>"


map <C-Left> <C-w>h
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l

nmap op o<Esc>k
nmap oi O<Esc>j
nmap oo A<CR>
nmap tt :bp<bar>sp<bar>bn<bar>bd<CR>
nmap ty :bn<CR>
nmap tr :bp<CR>
nmap td :bd<CR>
nmap th :split<CR>
nmap tv :vsplit<CR>

nmap te :tabe<CR>
nmap tc :tabclose<CR>
nmap tn :tabnext<CR>

tnoremap <A-Up> <C-\><C-n><C-w>k
tnoremap <A-Right> <C-\><C-n><C-w>l
tnoremap <A-Left> <C-\><C-n><C-w>h
tnoremap <A-Down> <C-\><C-n><C-w>j

nnoremap <C-q>            :exit<CR>
nnoremap <S-Right>        :vertical resize -2<CR>
nnoremap <S-Left>         :vertical resize +2<CR>
nnoremap <S-Up>           :resize -2<CR>
nnoremap <S-Down>         :resize +2<CR>

nnoremap fd _
nnoremap fg $
vnoremap fd _
vnoremap fg $

nnoremap <leader>a ggVG

nnoremap <F1> :on<CR>
nnoremap <F2> :%bd<bar>e#<bar>bd#<CR>
nnoremap <F3> :/
nnoremap <F4> :noh<CR>
nnoremap <F9> :PlugUpdate <bar> CocUpdate<CR>


" Terminals

nnoremap <leader>tv :vsplit<bar>terminal<CR>
nnoremap <leader>th :split<bar>terminal<CR>

autocmd TermOpen * setlocal nonu nornu scl=no
