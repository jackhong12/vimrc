set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

filetype plugin indent on     " required (根據檔案類型決定自動縮台格式)
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line


"set nocompatible
"filetype plugin indent on

" #vim 基本功能
"------------------------------------------------
set ft=tex
set syntax=markdown

set number              " 顯示行號 number relativenumber
set relativenumber 
set ai                  " 自動縮排
set tabstop=4           " tab縮排space數
set shiftwidth=4        " 縮排space數
set tw=80               " 一行最大字數 
set expandtab           " 輸入 tab 自動轉換成 space

set ruler               " 右下角顯示 	行，列 目前在文件位置% （預設模式）
set backspace=2         " 在 insert 模式啟用 blackspace (預設模式)
"set formatoption+=r     " 自動註解 （文件一行有註解，後面貼上都會有註解）

set history=100         " 保留100個使用過指令

set incsearch           " 在關鍵字尚未完全輸入完畢前就顯示結果 (ctrl+n)???

set hlsearch            " 搜尋反白
"set nohlsearch         " 搜尋完後關掉反白
set clipboard=unnamedplus " 複製到系統剪貼簿上


set nofoldenable        " disable folding
set foldmethod=indent   " setting folding 


" mapping key
"------------------------------------------------
" mapping <F9> to create a fold
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" #Key Mapping
"inoremap( ()<Esc>i     " 輸入 ( 自動產生 ()
"inoremap" ""<Esc>i"    " 輸入 " 自動產生 ""
"inoremap' ''<Esc>i"    " 輸入 ' 自動產生 ''
"inoremap[ []<Esc>i     " 輸入 [ 自動產生 []
"inoremap{{ {}<Esc>i    " 輸入 {{ 自動產生 {}
" 輸入 { + Enter 自動產生 { Enter } 
inoremap{<CR> {<CR>}<Esc>ko

" #游標選取
" >開啟游標		v(選取字元)	ctrl+insert(複製)	shift+insert(貼上)
set mouse=r
" >停用游標
"set mouse=""

" #背景風格
" for powerline
set laststatus=2
" >設定程式語法高亮功能 syntax <on/enable, off>
set t_Co=256


syntax on 
" >colorsheme <default, koehler, darkblue, desert, shine, ron, torte>
" colo desert 
"colorsheme gruvbox

" >顯示游標所在列
set cursorline
" >cursorline 效果     文字變化: cterm <none, underline, blod, reverse>		背景顏色: ctermbg	前景顏色: ctermfg	
"hi CursorLine cterm=none ctermbg=DarkMagenta ctermfg=White
" >顯示游標所在行
"set cursorcolumn
" >cursorcolumn 效果	文字變化: cterm <none, underline, blod, reverse>	背景顏色: ctermbg   前景顏色: ctermfg
"hi CursorColumn cterm=none ctermbg=DarkMagenta ctermfg=White

set completeopt-=preview
set background=dark
set backspace=indent,eol,start

map <F3> :tabp<CR>
map <F4> :tabn<CR>
map <F6> ?<CR>
map <F7> /<CR>

" Plugins
"================================================

"------------------------------------------------
" 在網頁顯示markdown
Plugin 'suan/vim-instant-markdown'

"------------------------------------------------
" 在vim 中使用 git 指令
Plugin 'tpope/vim-fugitive'

"------------------------------------------------
" 在vim 中快速移動
Plugin 'Lokaltog/vim-easymotion'

" A parser for condensed HTML format
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"------------------------------------------------
" Markdown plugin
"Plugin 'plasticboy/vim-markdown'
"Plugin 'cespare/vim-toml'
"let g:vim_markdown_toml_frontmatter = 1
"let g:vim_markdown_frontmatter=1    " LaTeX math


"------------------------------------------------
" 代碼格式
" Plugin 'Chiel92/vim-autoformat'

"------------------------------------------------
" Plugin airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" for powerline
" :help airline-customization
set encoding=utf-8
set rtp+=/home/hong/.local/lib/python3.6/site-packages/powerline/bindings/vim
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" set Airline theme
" github.com/vim-airline/vim-airline-themes
" good theme: ayu_mirage badwolf dark_minimal qwq term soda
let g:airline_theme='badwolf'

" let g:airline_symbols
let g:airline_powerline_fonts=1
" powerline extension
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#parts#ffenc#skip_expected_string='utf-8'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.branch = '✎'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.readonly = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.linenr = '➣'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
"------------------------------------------------
" NERDTree 
Plugin 'scrooloose/nerdtree'
" >NERDTree <F5> 快捷鍵開關
map <F5> :NERDTreeToggle<CR>    
"map <F5> :ls<CR>


"------------------------------------------------
" YouCompleteMe
" 代碼自動補全
Plugin 'Valloric/YouCompleteMe'
" .vimrc 讀入 .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

"------------------------------------------------
" Plugin godlygeek/tabular
" 表格排版
Plugin 'godlygeek/tabular'

"------------------------------------------------
" Plugin tagbar
" 在右視窗顯示function
Plugin 'majutsushi/tagbar'
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F8> :TagbarToggle<CR>

Plugin 'tpope/vim-rails.git'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'morhetz/gruvbox'
