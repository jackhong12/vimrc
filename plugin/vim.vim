" Settings for vim files

if has("autocmd")
    au BufEnter,BufNewFile,BufRead .vimrc,*.vim call s:set_vim()
    au BufLeave .vimrc,*.vim call s:unset_vim()

    " remove all spaces in the end of lines
    au BufWritePre .vimrc,*.vim :%s/\s\+$//e
endif

function! s:set_vim()
    set smartindent
    set autoindent
    set expandtab
    set shiftwidth=4
    set tabstop=4
    let s:tmpfoldmethod=&foldmethod
    set foldmethod=marker
    let s:tmpfoldmarker=&foldmarker
    set foldmarker={{{,}}}
    let s:tmpfoldtext=&foldtext
    set foldtext=VimFoldText()

    nnoremap <leader>s o<esc>DI" <esc>75A=<esc>A{{{<esc>^llR
    nnoremap <leader>e o<esc>DI" <esc>75A-<esc>A}}}<esc>^

    if exists('+colorcolumn')
        set colorcolumn=80
    endif
endfunction

function! s:unset_vim()
    let s:foldmethod=s:tmpfoldmethod
    let s:foldmarker=s:tmpfoldmarker
    let s:foldtext=s:tmpfoldtext

    nunmap <leader>s
    nunmap <leader>e

    if exists('+colorcolumn')
        set colorcolumn&
    endif
endfunction

function! VimFoldText()
    let content = substitute(getline(v:foldstart),"\" \\([^=]*\\)=*{{{", "- \\1",1)
    let txt = repeat("    " , v:foldlevel - 1) . content
    let line = txt . repeat(" ", (&columns - len(txt)))
    return line
endfunction
