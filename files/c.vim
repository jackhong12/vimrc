" Settings for c like files
if has("autocmd")
    au BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp call s:set_c_setting()
    au BufLeave *.c,*.h,*.cpp,*.hpp call s:unset_c_setting()

    " remove all spaces in the end of lines
    au BufWritePre *.c,*.h,*.cpp,*.hpp :%s/\s\+$//e
endif

function! s:set_c_setting()
    set smartindent
    set autoindent
    set expandtab
    set shiftwidth=4
    set tabstop=4
    inoremap {<cr> {<cr>}<esc>ko
    nnoremap <leader>p ohoShowMessage("hong: ");<esc>F"i

    if exists('+colorcolumn')
        "set colorcolumn=80
    endif
endfunction

function! s:unset_c_setting()
    iunmap {<cr>
    nunmap <leader>p


    if exists('+colorcolumn')
        set colorcolumn&
    endif
endfunction
