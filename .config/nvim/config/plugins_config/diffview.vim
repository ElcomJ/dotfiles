set fillchars+=diff:╱

hi DiffAdd      gui=none    guifg=NONE       guibg=#1C4428
hi DiffChange   gui=none    guifg=NONE       guibg=NONE
hi DiffDelete   gui=bold    guifg=NONE       guibg=#542426
hi DiffText     gui=none    guifg=NONE       guibg=#1E4273


lua << END
  local actions = require("diffview.actions")

  require('diffview').setup{}
END

nnoremap <leader>gd :DiffviewOpen<CR>
nnoremap <leader>gh :DiffviewFileHistory<CR>

hi FoldColumn guibg=NONE
