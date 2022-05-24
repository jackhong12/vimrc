"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

Plugin 'godlygeek/tabular'

Plugin 'preservim/nerdtree'
map <leader>h :NERDTreeToggle<CR>

"Plugin 'plasticboy/vim-markdown'
"let g:vim_markdown_math = 1

Plugin 'majutsushi/tagbar'
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <leader>l :TagbarToggle<CR>

Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

Plugin 'airblade/vim-gitgutter'

"Plugin 'plasticboy/vim-markdown'
"let g:vim_markdown_folding_disabled = 1
"let g:instant_markdown_autostart=0

Plugin 'Yggdroot/indentLine'
let g:indentLine_char_list = ['┊']
let g:indentLine_color_term = 239

" solidity file syntax highlight
"Plugin 'tomlion/vim-solidity'

"set showtabline=2
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='badwolf'
"let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" autocomplete
Plugin 'ycm-core/YouCompleteMe'
nnoremap gdf :YcmCompleter GoToDefinition<CR>
nnoremap sdf :split<CR><C-W>J:YcmCompleter GoToDefinition<CR>:resize 10<CR>
let g:ycm_global_ycm_extra_conf="~/.ycm_extra_conf.py"
set completeopt-=preview
"let g:ycm_show_diagnostics_ui = 0


" fancy symbols
Plugin 'ryanoasis/vim-devicons'

" searching idex
Plugin 'google/vim-searchindex'

"Plugin 'tpope/vim-fugitive'

Plugin 't9md/vim-choosewin'
let g:choosewin_overlay_enable = 1
nmap  -  <Plug>(choosewin)

syntax on                              " color setting
set t_Co=256                           " color setting
colorscheme molokai
" marokai set
hi Normal         ctermfg=254   ctermbg=none
hi CursorLine                   ctermbg=none  cterm=underline
hi CursorLineNr   ctermfg=208   ctermbg=none  cterm=bold
hi LineNr         ctermfg=245   ctermbg=none  cterm=none
" 括號顏色
hi MatchParen     ctermfg=161   ctermbg=254   cterm=bold
