"" Settings for markdown files
""
""     - <leader>d: insert <details> tag
""     - <leader>c: insert check list
""
""   vim-markdown
""     - <leader>t: toggle concealing
"
"if has("autocmd")
"    au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
"    au BufNewFile,BufRead,WinEnter *.md call s:set_markdown()
"    au WinLeave *.md call s:unset_markdown()
"
"    " remove all spaces in the end of lines
"    au BufWritePre *.md :%s/\s\+$//e
"endif
"
"Plugin 'preservim/vim-markdown'
"let g:vim_markdown_folding_disabled = 1
"
"function! s:set_markdown()
"    set smartindent
"    set autoindent
"    set expandtab
"    set shiftwidth=4
"    set tabstop=4
"
"    nnoremap <leader>d o<cr><details><cr><cr><summary></summary><cr><cr></details><cr><esc>kkk^wwli
"    nnoremap <leader>c o- [ ] <esc>A
"    nnoremap <leader>t :call ToggleMdConceal()<cr>
"endfunction
"
"function! s:unset_markdown()
"    nunmap <leader>d
"    nunmap <leader>c
"    nunmap <leader>t
"endfunction
"
"function! g:ToggleMdConceal()
"    if &conceallevel == 0
"        set conceallevel=3
"    else
"        set conceallevel=0
"    endif
"endfunction

" markdown: use gf to search target file from current git root
if has("autocmd")
    augroup markdown_git_root_gf
        autocmd!
        autocmd BufNewFile,BufRead *.md call s:enable_markdown_git_root_gf()
    augroup END
endif

function! s:enable_markdown_git_root_gf() abort
    nnoremap <buffer> <silent> gf :call <SID>markdown_git_root_gf()<CR>
endfunction

function! s:markdown_git_root_gf() abort
    let l:target = expand('<cfile>')
    if empty(l:target)
        return
    endif

    " handle home/absolute path directly (e.g. ~/notes/todo.md)
    if l:target =~# '^\~/' || l:target =~# '^/'
        let l:absolute_target = expand(l:target)
        if filereadable(l:absolute_target) || isdirectory(l:absolute_target)
            execute 'edit ' . fnameescape(l:absolute_target)
        else
            echohl WarningMsg
            echom 'File not found: ' . l:target
            echohl None
        endif
        return
    endif

    let l:git_root = systemlist('git -C ' . shellescape(expand('%:p:h')) . ' rev-parse --show-toplevel')
    if v:shell_error != 0 || empty(l:git_root)
        execute 'normal! gf'
        return
    endif

    let l:matches = globpath(l:git_root[0], '**/' . escape(l:target, '[]*?{}'), 0, 1)

    " fallback: if no match and target has no extension, try .md
    if empty(l:matches) && fnamemodify(l:target, ':e') ==# ''
        let l:matches = globpath(l:git_root[0], '**/' . escape(l:target . '.md', '[]*?{}'), 0, 1)
    endif

    if empty(l:matches)
        echohl WarningMsg
        echom 'File not found in git root: ' . l:target
        echohl None
        return
    endif

    execute 'edit ' . fnameescape(l:matches[0])
endfunction
