### install pynvim

### copy and paste .vimspector.json in your project root (only python)

### Vimspector Config:

```
" Vimspector

let g:vimspector_install_gadgets = [ 'CodeLLDB' ]

let g:vimspector_sidebar_width = 45
let g:vimspector_bottombar_height = 10
let g:vimspector_terminal_maxwidth = 50

nnoremap <leader>dl  :call vimspector#Launch()<CR>
nnoremap <leader>dr  :call vimspector#Reset()<CR>
nnoremap <leader>dc  :call vimspector#Continue()<CR>

nnoremap <leader>db  :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dB  :call vimspector#ClearBreakpoints()<CR>

nnoremap <leader>dR  <Plug>VimspectorRestart
nnoremap <leader>do  <Plug>VimspectorStepOver
vnoremap <leader>de  <Plug>VimspectorBalloonEval
nnoremap <leader>dw  :call vimspector#AddWatch()<CR>
```
