" Settings for c like files
if has("autocmd")
    au BufNewFile,BufRead,WinEnter *.c,*.h,*.cpp,*.hpp call s:set_c_setting()
    au WinLeave *.c,*.h,*.cpp,*.hpp call s:unset_c_setting()

    " remove all spaces in the end of lines
    "au BufWritePre *.c,*.h,*.cpp,*.hpp :%s/\s\+$//e
endif

function! s:set_c_setting()
    set smartindent
    set autoindent
    set expandtab
    set shiftwidth=2
    set tabstop=2
    set colorcolumn=80
    inoremap {<cr> {<cr>}<esc>ko
    nnoremap <leader>p ohoShowMessage("hong: \n");<esc>F"i

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
