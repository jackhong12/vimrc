" :help
set encoding=utf8
set backspace=indent,eol,start
set number
set ai                                 " autoindet
set tabstop=4
set shiftwidth=4
set expandtab
set tw=80
set cursorline
set showcmd
set clipboard=unnamedplus
set foldmethod=syntax
set nofoldenable                       " folding
set incsearch                          " While typing a search command, show where the pattern.
set hlsearch                           " When there is a previous search pattern, highlight all its matches. (nohlsearch)
set nowrap

" key mapping
imap jk <ESC>
imap kj <ESC>
inoremap{<CR> {<CR>}<Esc>ko
" buffer files switching
nnoremap <F2> :bp<cr>
nnoremap <F3> :bn<cr>

" last time position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" remove all spaces in the end of the lines when saving files
autocmd BufWritePre * :%s/\s\+$//e
" turn on cursoline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
