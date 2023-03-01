" Settings for zsh scripts
if has("autocmd")
    au BufNewFile,BufRead *.zsh call s:set_zsh()
    au BufLeave *.zsh call s:unset_zsh()

    " remove all spaces in the end of lines
    au BufWritePre *.zsh :%s/\s\+$//e 
endif

function! s:set_zsh()
    set shiftwidth=4
    set tabstop=4
endfunction

function! s:unset_zsh()
endfunction
