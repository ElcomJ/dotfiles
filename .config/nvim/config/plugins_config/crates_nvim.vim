lua << END
  require('crates').setup()
END

nnoremap <leader>cv :lua require('crates').show_versions_popup()<CR>
nnoremap <leader>cf :lua require('crates').show_features_popup()<CR>
nnoremap <leader>cd :lua require('crates').show_dependencies_popup()<CR>

nnoremap <silent> . :call <SID>show_documentation_crates()<CR>

function! s:show_documentation_crates()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (index(['man'], &filetype) >= 0)
        execute 'Man '.expand('<cword>')
    elseif (expand('%:t') == 'Cargo.toml' && luaeval('require("crates").popup_available()'))
        lua require('crates').show_popup()
    else
        lua vim.lsp.buf.hover()
    endif
endfunction
