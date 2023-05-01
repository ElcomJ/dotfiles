lua << END
  require('telescope').load_extension('vim_bookmarks')
  require('telescope').load_extension('neoclip')
END

nnoremap <leader>ff   <cmd>Telescope find_files<CR>
nnoremap <leader>fg   <cmd>Telescope live_grep<CR>
nnoremap <leader>fb   <cmd>Telescope buffers<CR>
nnoremap <leader>fp   <cmd>Telescope vim_bookmarks all<CR>
nnoremap <leader>fy   <cmd>Telescope neoclip<CR>

hi TelescopeBorder guibg=NONE
hi TelescopeTitle  guibg=NONE
