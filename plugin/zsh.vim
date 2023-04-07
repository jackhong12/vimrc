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
    let s:tmpfoldmethod=&foldmethod
    set foldmethod=marker
    let s:tmpfoldmarker=&foldmarker
    set foldmarker={{{,}}}
    let s:tmpfoldtext=&foldtext
    set foldtext=VimFoldText()

    inoremap {<cr> {<cr>}<esc>ko
endfunction

function! s:unset_zsh()
    let s:foldmethod=s:tmpfoldmethod
    let s:foldmarker=s:tmpfoldmarker
    let s:foldtext=s:tmpfoldtext
endfunction

function! VimFoldText()
    let content = substitute(getline(v:foldstart),"\# \\(.*\\){{{", "- \\1",1)
    let txt = repeat("    " , v:foldlevel - 1) . content
    let line = txt . repeat(" ", (&columns - len(txt)))
    return line
endfunction
