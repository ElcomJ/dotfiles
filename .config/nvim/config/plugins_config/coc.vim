let g:coc_global_extensions = [
\  'coc-explorer',
\  'coc-prettier',
\  'coc-rust-analyzer',
\  'coc-go',
\  'coc-clangd'
\]

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
nnoremap <C-a> :CocCommand explorer<CR>
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> cd :CocDiagnostics<CR>

nnoremap <silent> ac <Plug>(coc-codeaction-cursor)
vnoremap <silent> as <Plug>(coc-codeaction-selected)
nnoremap <silent> fj <Plug>(coc-float-jump)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> rn <Plug>(coc-rename)

nnoremap <silent> ; :call <SID>show_documentation_coc()<CR>

function! s:show_documentation_coc()
   if (index(['vim','help'], &filetype) >= 0)
     execute 'h '.expand('<cword>')
   else
     call CocAction('doHover')
   endif
endfunction

autocmd FileType qf setlocal nonu nornu cc= scl=no
hi QuickFixLine ctermbg=NONE

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
