"-------------------------------------------------------------------------------
" Only put common settings in this file
"-------------------------------------------------------------------------------

" zo: open fold
" zc: close fold

" note ======================================================================{{{

" mappings =================================================================={{{
" <F1> ~ <F12>
"     <F1>            : previous file
"     <F2>            : next file
"     <F3>            : previous git difference
"     <F4>            : next git difference
"     <F5>            : highlight git difference
"     <F6>            : help
"
" leader keys
"     <leader><space> : clear matching
"     <leader>a       : tabular alignment
"     <leader>h       : toggle nerd tree
"     <leader>z       : focus folding
"
" others
"     jk              : ESC
"     H               : move to the head of the line
"     L               : move to the end of the line

" ---------------------------------------------------------------------------}}}

" ---------------------------------------------------------------------------}}}
" plugins ==================================================================={{{
let mapleader=',' " set leader key
set nocompatible  " be iMproved, required
filetype off      " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on
Plugin 'gmarik/vundle'

" vim-rainbow ==============================================================={{{
Plugin 'frazrepo/vim-rainbow'
au FileType c,cpp,objc,objcpp call rainbow#load()

" ---------------------------------------------------------------------------}}}
" vim-airline ==============================================================={{{
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme                        = 'badwolf'
let g:airline_powerline_fonts              = 1
let g:airline#extensions#tabline#enabled   = 1
let g:airline#extensions#tabline#formatter = 'default'

" ---------------------------------------------------------------------------}}}
" vim-devicons =============================================================={{{
Plugin 'ryanoasis/vim-devicons'

" ---------------------------------------------------------------------------}}}
" vim-gitgutter ============================================================={{{
Plugin 'airblade/vim-gitgutter'

" ---------------------------------------------------------------------------}}}
" supertab =================================================================={{{
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"

" ---------------------------------------------------------------------------}}}
" indentLine================================================================={{{
Plugin 'Yggdroot/indentLine'
let g:indentLine_char_list = ['┊']
let g:indentLine_color_term = 239

" ---------------------------------------------------------------------------}}}
" tabular ==================================================================={{{
" usage:
"     :Tab/<key>
Plugin 'godlygeek/tabular'

" ---------------------------------------------------------------------------}}}
" nerdtree =================================================================={{{
Plugin 'preservim/nerdtree'

" ---------------------------------------------------------------------------}}}

" ---------------------------------------------------------------------------}}}
" basic options ============================================================={{{
" global options
" NOTE:
" 1. set background needs to be before syntax highlight for vim 6.x.
" 2. type :digraphs to access the default di-graph code mapping
"    type ^K+{char1}{char2} to input digraphs
" 3. if you setenv DISPLAY to a machine which does not enable xhost +,
"    some versions of vim will get stuck.
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
"set digraph
" TODO
"set dictionary=
"set showbreak

" highlight ================================================================={{{
set incsearch
set hlsearch
set ignorecase
"set smartcase

" ---------------------------------------------------------------------------}}}
" indent ===================================================================={{{
set smartindent
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4

" ---------------------------------------------------------------------------}}}
" display unvisible symbols ================================================={{{
set nolist
set listchars=eol:$,tab:>-,extends:>,precedes:<

" ---------------------------------------------------------------------------}}}

" ---------------------------------------------------------------------------}}}
" color scheme =============================================================={{{
syntax on
set t_Co=256
let g:rehash256=1
colorscheme molokai

" ---------------------------------------------------------------------------}}}
" other files ==============================================================={{{
" vim will auto load files in ~/.vim/plugin

" ---------------------------------------------------------------------------}}}
" autocommand ==============================================================={{{
" help
"     :autocmd : show all auocmd

if has("autocmd")
    augroup redhat
        " clear redhat settings (for last time position)
        autocmd!
    augroup END

    " last time position
    au BufReadPost *
        \ if
        \     line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif

    " resize window
    au VimResized * exe "normal! \<c-w>="

    au WinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
endif
" ---------------------------------------------------------------------------}}}
" functions ================================================================={{{

" execute in shell =========================================================={{{
function! s:ExecuteInShell(command)
    let command=join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!' . command
    silent! redraw
    let tmpcmd='au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd'''
    silent! execute 'au BufUnload <buffer> :' . bufnr('#') . 'wincmd w'
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<cr>:AnsiEsc<cr>'
    silent! execute 'nnoremap <silent> <buffer> q :q<cr>'
    silent! execute 'AnsiEsc'
    echo 'Shell command ' . command . ' executed.'
endfunction
" ---------------------------------------------------------------------------}}}

" ---------------------------------------------------------------------------}}}
" key mappings =============================================================={{{

" <F1> ~ <F12> =============================================================={{{
nnoremap <F1> :bp<cr>
nnoremap <F2> :bn<cr>
nnoremap <F3> :GitGutterPrevHunk<cr>zvzz
nnoremap <F4> :GitGutterNextHunk<cr>zvzz
nnoremap <F5> :GitGutterLineHighlightsToggle<cr>
nnoremap <F6> :set paste!<cr>
"map <F6>      :help <C-R><C-W><CR>
"   <F7> I reserve F7 for SnippetsEmu plugin.
"   <F8> I reserve F8 for SuperTab plugin.
map <F9> <ESC>:set paste!<CR>
"map <F9> :set paste<CR>i
map <ESC>[H 0
map <ESC>Ow $

" ---------------------------------------------------------------------------}}}
" leader keys ==============================================================={{{
map      <leader><space>     : noh<cr>:call clearmatches()<cr>
vnoremap <leader>a           : Tab/
map      <leader>h           : NERDTreeToggle<cr>
nnoremap <silent> <leader>/  : execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>
nnoremap <leader>ev          : vsp ~/.vimrc<cr>/" note<cr>
nnoremap <leader>!           : Shell
nnoremap <leader>z           zMzvzz

command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

" ---------------------------------------------------------------------------}}}
" other keys ================================================================{{{
imap     jk <ESC>
nnoremap n  nzzzv
nnoremap N  Nzzzv
"nnoremap H  0
"nnoremap L  g_
nnoremap *  *zzzv
nnoremap #  #zzzv
" TODO
" g; g;zz
" g: g:zz

" ---------------------------------------------------------------------------}}}

" ---------------------------------------------------------------------------}}}
