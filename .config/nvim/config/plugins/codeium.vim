let g:codeium_enabled = v:false
let g:codeium_disable_bindings = 1

imap <script><silent><nowait><expr> <Tab> codeium#Accept()
imap <M-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <M-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <M-.>   <Cmd>call codeium#Clear()<CR>
