lua << END
  require("hop").setup{}
END

nnoremap <silent> / :HopWord<CR>
vnoremap <silent> / <cmd>HopWord<CR>
nnoremap <silent> \ :HopLine<CR>
vnoremap <silent> \ <cmd>HopLine<CR>
