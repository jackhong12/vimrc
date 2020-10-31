set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'godlygeek/tabular'

Plugin 'preservim/nerdtree'
map <C-i> :NERDTreeToggle<CR>

"Plugin 'plasticboy/vim-markdown'
"let g:vim_markdown_math = 1

Plugin 'majutsushi/tagbar'
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <C-o> :TagbarToggle<CR>

Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

Plugin 'airblade/vim-gitgutter'

"Plugin 'plasticboy/vim-markdown'
"let g:vim_markdown_folding_disabled = 1
"let g:instant_markdown_autostart=0

Plugin 'Yggdroot/indentLine'
let g:indentLine_char_list = ['┊']
let g:indentLine_color_term = 239

" solidity file syntax highlight
Plugin 'tomlion/vim-solidity'

"set showtabline=2
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='badwolf'
"let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'default'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'ryanoasis/vim-devicons'

Plugin 'google/vim-searchindex'
set guifont=DroidSansMono\ Nerd\ Font\ 11
filetype plugin indent on     " required (根據檔案類型決定自動縮台格式)

set encoding=utf8
" (for vim 8.2) remove weird symbols.
let &t_TI = ""
let &t_TE = ""

set number
set expandtab

set cursorline
set clipboard=unnamedplus
set showcmd
set nowrap

set incsearch
set hlsearch
set nohlsearch

" folding
set foldmethod=syntax
set nofoldenable

" only for c and c++ file
if &filetype ==# 'c' || &filetype ==# 'cpp' || &filetype ==# 'h' || &filetype ==# 'hpp'
    set tw=80
endif

if &filetype ==# 'launch' || &filetype ==# 'xml'
    set tabstop=2
    set shiftwidth=2
else
    set tabstop=4
    set shiftwidth=4
endif

" last time position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" key mapping
inoremap{<CR> {<CR>}<Esc>ko
inoremap jk <ESC>
"inoremap <c-h> <esc>xa

let mapleader=','
nnoremap <leader>v :vsplit $MYVIMRC<cr>
nnoremap <leader>t :term<cr><c-w><s-j>
nnoremap <leader>l :bNext<cr>
nnoremap <leader>h :bprevious<cr>

" airline
nnoremap <F2> :bp<cr>
nnoremap <F3> :bn<cr>


" color setting
syntax on
set laststatus=2
set t_Co=256
let g:rehash256=1

" >colorsheme <default, koehler, darkblue, desert, shine, ron, torte>
"colorscheme ron
colorscheme molokai

" ros launch file syntax highliight
autocmd BufRead,BufNewFile *.launch setfiletype xml

" marokai set
hi Normal         ctermfg=254   ctermbg=none
hi CursorLine                   ctermbg=none  cterm=underline
hi CursorLineNr   ctermfg=208   ctermbg=none  cterm=bold
hi LineNr         ctermfg=245   ctermbg=none  cterm=none
" 括號顏色
hi MatchParen     ctermfg=161   ctermbg=254   cterm=bold

" launch file
au BufNewFile,BufRead *.launch setf xml

" turn on cursoline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
au BufNewFile,BufRead *.launch setl tabstop=2
au BufNewFile,BufRead *.launch setl shiftwidth=2

" remove all spaces in the end of the lines when saving files
autocmd BufWritePre * :%s/\s\+$//e
