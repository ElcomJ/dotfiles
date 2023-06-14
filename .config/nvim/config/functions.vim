function! Tabline() abort
  let l:line = ''
  let l:current = tabpagenr()

  for l:i in range(1, tabpagenr('$'))
    if l:i == l:current
      let l:line .= '%#TabLineSel#'
    else
      let l:line .= '%#TabLine#'
    endif

    let l:label = fnamemodify(
      \ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
      \ ':t'
    \ )

    let l:bufnr = tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]
    if getbufvar(l:bufnr, '&mod') == 1
      let l:label = '* ' . l:label
    endif

    let l:line .= '%' . i . 'T' " Starts mouse click target region.
    let l:line .= '  ' . l:label . '  '
  endfor

  let l:line .= '%#TabLineFill#'
  let l:line .= '%T' " Ends mouse click target region(s).

  return l:line
endfunction


function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
