lua << END
  require("bufferline").setup{}
END

nnoremap <silent> bs :BufferLinePick<CR>
nnoremap <silent> bp :BufferLineTogglePin<CR>
