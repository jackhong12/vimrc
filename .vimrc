set nocompatible              " be iMproved, required
filetype off                  " required


"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep Plugin commands between here and filetype plugin indent on.
" scripts on GitHub repos
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
" " scripts not on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" ...
"
" @Plugin Nerd Commenter
Plugin 'scrooloose/nerdcommenter'

" -------------------------------------------------------------------------------------------------
" @Plugin Vim-Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" set Airline theme
let g:airline_theme='simple'

let g:airline_powerline_fonts=1

" This is disabled by default; add the following to your vimrc to enable the extension:
let g:airline#extensions#tabline#enabled = 1

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

" #NERDTree 
Plugin 'scrooloose/nerdtree'
" >NERDTree <F5> 快捷鍵開關
map <F5> :NERDTreeToggle<CR>

"map <F5> :ls<CR>
" #YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" > .vimrc 讀入 .ycm_extra_conf.py
let g:ycm_global_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_global_extra_conf = 0

"set nocompatible
"filetype plugin indent on

" -------------------------------------------------------------------------------------------------
" #vim 基本功能
" >顯示行號
set number 
" >自動縮排
set ai
" >縮排間隔數<tab>
set tabstop=4
" >自動縮排對齊間隔數
set shiftwidth=4
" >輸入 tab 自動轉換成 space
"set expandtab
" >右下角顯示 	行，列 目前在文件位置% （預設模式）
set ruler
" >在 insert 模式啟用 blackspace (預設模式)
set backspace=2
" >自動註解 （文件一行有註解，後面貼上都會有註解）
"set formatoption+=r
" >保留100個使用過指令
set history=100
" >在關鍵字尚未完全輸入完畢前就顯示結果 (ctrl+n)???
set incsearch 
" >setting folding
set foldmethod=indent

" #Key Mapping
" >輸入 ( 自動產生 ()
"inoremap( ()<Esc>i
" >輸入 " 自動產生 ""
"inoremap" ""<Esc>i"
" >輸入 ' 自動產生 ''
"inoremap' ''<Esc>i"
" >輸入 [ 自動產生 []
"inoremap[ []<Esc>i
" >輸入 {{ 自動產生 {}
"inoremap{{ {}<Esc>i
" >輸入 { + Enter 自動產生 { Enter } 
inoremap{<CR> {<CR>}<Esc>ko

" #游標選取
" >開啟游標		v(選取字元)	ctrl+insert(複製)	shift+insert(貼上)
set mouse=r
" >停用游標
"set mouse=""

" #背景風格
" >設定程式語法高亮功能 syntax <on/enable, off>
syntax on 
" >colorsheme <default, koehler, darkblue, desert, shine, ron, torte>
colo desert 
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
set t_Co=256
set backspace=indent,eol,start

map <F3> :tabp<CR>
map <F4> :tabn<CR>
map <F6> :make<CR>
map <F7> :make run<CR>
