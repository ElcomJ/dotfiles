let g:ale_fixers = {
\   '*':    ['trim_whitespace', 'remove_trailing_lines'],
\   'rust': ['rustfmt'],
\   'go':   ['gofmt'],
\   'c':    ['clang-format'],
\   'cpp':  ['clang-format'],
\}

let g:ale_c_clangformat_options  = '"-style={
\ BasedOnStyle: google,
\ IndentWidth: 4,
\ ColumnLimit: 79,
\ AllowShortFunctionsOnASingleLine: None,
\ }"'

let g:ale_virtualtext_cursor     = 'disabled'
let g:ale_fix_on_save            = 1

hi ALEErrorSign            guibg=NONE   guifg=Red
hi ALEWarningSign          guibg=NONE   guifg=Yellow
hi ALEInfoSign             guibg=NONE
