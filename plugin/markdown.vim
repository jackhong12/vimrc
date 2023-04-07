" Settings for markdown files
"
"     - <leader>d: insert <details> tag
"     - <leader>c: insert check list
"
"   vim-markdown
"     - <leader>t: toggle concealing

if has("autocmd")
    au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
    au BufNewFile,BufRead,WinEnter *.md call s:set_markdown()
    au WinLeave *.md call s:unset_markdown()

    " remove all spaces in the end of lines
    au BufWritePre *.md :%s/\s\+$//e
endif

Plugin 'preservim/vim-markdown'
let g:vim_markdown_folding_disabled = 1

function! s:set_markdown()
    set smartindent
    set autoindent
    set expandtab
    set shiftwidth=4
    set tabstop=4

    nnoremap <leader>d o<cr><details><cr><cr><summary></summary><cr><cr></details><cr><esc>kkk^wwli
    nnoremap <leader>c o- [ ] <esc>A
    nnoremap <leader>t :call ToggleMdConceal()<cr>
endfunction

function! s:unset_markdown()
    nunmap <leader>d
    nunmap <leader>c
    nunmap <leader>t
endfunction

function! g:ToggleMdConceal()
    if &conceallevel == 0
        set conceallevel=3
    else
        set conceallevel=0
    endif
endfunction
