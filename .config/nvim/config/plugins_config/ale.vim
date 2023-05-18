let g:ale_fixers = {
\   '*':    ['trim_whitespace', 'remove_trailing_lines'],
\   'rust': ['rustfmt'],
\}

let g:ale_virtualtext_cursor     = 'disabled'
let g:ale_fix_on_save            = 1

hi ALEErrorSign            guibg=NONE   guifg=Red
hi ALEWarningSign          guibg=NONE   guifg=Yellow
hi ALEInfoSign             guibg=NONE
