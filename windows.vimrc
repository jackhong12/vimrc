" Use Vim defaults instead of Vi compatibility
set nocompatible

" Disable filetype detection temporarily (required by Vundle)
filetype off

" Add Vundle to runtime path (IMPORTANT: correct Windows path)
set rtp+=~/vimfiles/bundle/Vundle.vim

" Initialize Vundle
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Example plugins (you can add more)
Plugin 'preservim/nerdtree'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme                        = 'badwolf'
let g:airline_powerline_fonts              = 1
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'default'

Plugin 'github/copilot.vim'
" Map <C-J> to accept Copilot suggestions
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

Plugin 'Yggdroot/indentLine'
let g:indentLine_char_list = ['┊']
let g:indentLine_color_term = 239

Plugin 'mhinz/vim-signify'

" End Vundle setup
call vundle#end()

" Re-enable filetype detection
filetype plugin indent on

" Basic settings
syntax on
set number
set nocompatible
set wildmenu
set nostartofline
set esckeys
set ruler
set secure
set number
set showmatch   " jump to the matching bracket
set showmode    " show mode
set matchtime=1 " 1 sec matching time
set linebreak
set exrc
set cinoptions=t0,(0,l1,g1,h1,i4,w1,W4
set backspace=2
set whichwrap=<,>,[,]
set background=dark
set path=.,~,/usr/include,/usr/openwin/include,/usr/local/include
set laststatus=2
set tags=tags,../tags,../../tags,../../../tags
set guioptions+=a
set nowrap
set cursorline
set cscopetag
set mouse=a      " enable mouse mode
set ttymouse=sgr " enable to drag window
set shortmess+=A " ignore swap files warning
set showcmd      " show commands in left bottom corner
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//
set undodir=~/.cache/vim/undo//
set colorcolumn=72

" show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Color
set t_Co=256
let g:rehash256=1
colorscheme molokai

highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE

" Mapping
imap jk <ESC>
nnoremap <F1>  :bp<cr>
nnoremap <F2>  :bn<cr>
nnoremap <F3>  :call sy#jump#prev_hunk(v:count1)<cr>zvzz
nnoremap <F4>  :call sy#jump#next_hunk(v:count1)<cr>zvzz
nnoremap <F5>  :YcmCompleter GoTo<cr>
