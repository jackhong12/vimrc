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
"     <F3>            : previous changed sections
"     <F4>            : next changed sections
"     <F5>            : fold unchanged sections
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

" OS detection
let g:is_windows = has('win32')
let g:is_mac = has('mac') || has('macunix')
let g:is_linux = has('unix') && !g:is_mac

let mapleader=',' " set leader key


" plugins ==================================================================={{{
let g:use_rainbow    = 0
let g:use_airline    = 0
let g:use_devicons   = 0
let g:use_signify    = 0
let g:use_supertab   = 0
let g:use_indentline = 0
let g:use_tabular    = 0
let g:use_nerdtree   = 0
let g:use_tmux       = 0
let g:use_perforce   = 0
let g:use_easyalign  = 0
let g:use_ycm        = 0
let g:use_copilot    = 0
let g:use_tablegen   = 0
let g:use_fugitive   = 0

" Plugin switches: 1 = enabled, 0 = disabled (Linux default: all on)
if g:is_linux || g:is_mac
  " linux settings
  let g:use_rainbow    = 1
  let g:use_airline    = 1
  let g:use_devicons   = 1
  let g:use_signify    = 1
  let g:use_supertab   = 1
  let g:use_indentline = 1
  let g:use_tabular    = 1
  let g:use_nerdtree   = 1
  let g:use_tmux       = 1
  let g:use_perforce   = 1
  let g:use_easyalign  = 1
  let g:use_ycm        = 0
  let g:use_copilot    = 1
  let g:use_tablegen   = 1
  let g:use_fugitive   = 1
elseif g:is_windows
  " windows settings
  let g:use_rainbow    = 1
  let g:use_airline    = 1
  let g:use_signify    = 1
endif

set nocompatible
filetype off
if g:is_windows
  set rtp+=~/vimfiles/bundle/Vundle.vim
else
  set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()

" vim-rainbow ==============================================================={{{
if g:use_rainbow
  Plugin 'frazrepo/vim-rainbow'
  au FileType c,cpp,objc,objcpp call rainbow#load()
endif

" ---------------------------------------------------------------------------}}}

" vim-airline ==============================================================={{{
if g:use_airline
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  let g:airline_theme                        = 'badwolf'
  let g:airline_powerline_fonts              = 1
  let g:airline#extensions#tabline#enabled   = 1
  let g:airline#extensions#tabline#formatter = 'default'
endif

" ---------------------------------------------------------------------------}}}

" vim-devicons =============================================================={{{
if g:use_devicons
  Plugin 'ryanoasis/vim-devicons'
endif

" ---------------------------------------------------------------------------}}}

" vim-signify ==============================================================={{{
if g:use_signify
  Plugin 'mhinz/vim-signify'
endif

" ---------------------------------------------------------------------------}}}

" supertab =================================================================={{{
if g:use_supertab
  Plugin 'ervandew/supertab'
  let g:SuperTabDefaultCompletionType = "<c-n>"
endif

" ---------------------------------------------------------------------------}}}

" indentLine================================================================={{{
if g:use_indentline
  Plugin 'Yggdroot/indentLine'
  let g:indentLine_char_list = ['┊']
  let g:indentLine_color_term = 239
endif

" ---------------------------------------------------------------------------}}}

" tabular ==================================================================={{{
" usage:
"     :Tab/<key>
if g:use_tabular
  Plugin 'godlygeek/tabular'
endif

" ---------------------------------------------------------------------------}}}

" nerdtree =================================================================={{{
if g:use_nerdtree
  Plugin 'preservim/nerdtree'
endif

" ---------------------------------------------------------------------------}}}

" tmux-complete ============================================================={{{
if g:use_tmux
  Bundle 'wellle/tmux-complete.vim'
endif

" ---------------------------------------------------------------------------}}}

" vim-perforce =============================================================={{{
" :P4edit
" :P4revert
" :P4movetocl
if g:use_perforce
  Bundle 'nfvs/vim-perforce'
endif

" ---------------------------------------------------------------------------}}}

" vim-easy-align ============================================================{{{
if g:use_easyalign
  Plugin 'junegunn/vim-easy-align'
  nmap ga <Plug>(EasyAlign)
  xmap ga <Plug>(EasyAlign)
endif

" ---------------------------------------------------------------------------}}}

" YouCompleteMe: Auto-Complete =============================================={{{
if g:use_ycm
  Plugin 'ycm-core/YouCompleteMe'
  set completeopt-=preview " Don't show preview window

  nnoremap gd :YcmCompleter GoTo<cr>
  nnoremap gc :YcmCompleter GoToCallers<cr>
endif

" Short Key:
"   - Auto jump
"       :YouCompleter GoTo
"   - Jump back
"       <crl> + o

" Setup for compile flags
" let g:command_config_path='/path/to/compile_commands.json'

" ---------------------------------------------------------------------------}}}

" Copilot ==================================================================={{{
" Insall:
"   :Copilot setup
if g:use_copilot
  Plugin 'github/copilot.vim'

  " Map <C-J> to accept Copilot suggestions
  imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
endif

" ---------------------------------------------------------------------------}}}

" vim-markdown: Markdown Syntax ============================================={{{
"Plugin 'preservim/vim-markdown'

" ---------------------------------------------------------------------------}}}

" vim-polyglot: Multi-language support for markdown ========================={{{
"Plugin 'sheerun/vim-polyglot'

" ---------------------------------------------------------------------------}}}

" vim-fugitive: Git wrapper for Vim ========================================={{{
" :Git diff: show git diff in vim

if g:use_fugitive
  Plugin 'tpope/vim-fugitive'
endif

" vim-fugitive --------------------------------------------------------------}}}

" vim-tablegen: TableGen Syntax Highlight ==================================={{{
if g:use_tablegen
  Plugin 'antiagainst/vim-tablegen'
endif
" vim-tablegen --------------------------------------------------------------}}}

call vundle#end()
filetype plugin indent on " Re-enable filetype detection

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
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//
set undodir=~/.cache/vim/undo//
set colorcolumn=72

" show trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"set digraph
" TODO
"set dictionary=
"set showbreak

" highlight ================================================================={{{
set incsearch
set hlsearch
"set ignorecase
set smartcase

" ---------------------------------------------------------------------------}}}
" indent ===================================================================={{{
set smartindent
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2

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

" vim-signify
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE

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

" key mappingos =============================================================={{{

" <F1> ~ <F12> =============================================================={{{
nnoremap <F1>  :bp<cr>
nnoremap <F2>  :bn<cr>
nnoremap <F3>  :call sy#jump#prev_hunk(v:count1)<cr>zvzz
nnoremap <F4>  :call sy#jump#next_hunk(v:count1)<cr>zvzz
nnoremap <F5>  :YcmCompleter GoTo<cr>
nnoremap <F6>  :call FoldToggle()<cr>zvzz
nnoremap <F7>  :set paste!<cr>
"nnoremap <F8>  :NERDTreeToggle<cr>
"nnoremap <F12> :call P4Reopen()<cr>
"map <F6>      :help <C-R><C-W><CR>
"   <F7> I reserve F7 for SnippetsEmu plugin.
"   <F8> I reserve F8 for SuperTab plugin.
"map <F9> <ESC>:set paste!<CR>
"map <F9> :set paste<CR>i
map <ESC>[H 0
map <ESC>Ow $

" ---------------------------------------------------------------------------}}}
" leader keys ==============================================================={{{
map      <leader><space>     : noh<cr>:call clearmatches()<cr>
vnoremap <leader>a           : Tab/
map      <leader>h           : NERDTreeToggle<cr>
nnoremap <silent> <leader>/  : execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>
nnoremap <leader>eb          : sp ~/.vim/buffer.txt<cr>
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
nnoremap <space> :noh<cr>
" TODO
" g; g;zz
" g: g:zz

" ---------------------------------------------------------------------------}}}

" ---------------------------------------------------------------------------}}}

"" Completely disable folding
"set nofoldenable
"set foldmethod=manual
"
"" For LaTeX files specifically
"autocmd FileType tex setlocal nofoldenable foldmethod=manual
"
"let g:vimtex_fold_enabled = 0
"
"let g:Tex_FoldedSections = 0
"let g:Tex_FoldedEnvironments = 0
"let g:Tex_FoldedMisc = 0
"
"set conceallevel=0


function! ExtractCppSnippetToBuffer()
  let l:start = search('```cpp', 'bnW')
  let l:end = search('```', 'nW')
  if l:start > 0 && l:end > l:start
    execute l:start.','.l:end.'copy $'
    belowright new tmp_snippet.cpp
    put
  else
    echo "No cpp snippet found"
  endif
endfunction

nnoremap <leader>yc :call ExtractCppSnippetToBuffer()<CR>

" FoldToggle: cycle no-fold -> indent-fold -> signify-fold -> no-fold ======={{{
let s:fold_state = 0

function! FoldToggle()
  if s:fold_state == 0
    " state 0 -> 1: use indent folding
    setlocal foldmethod=indent
    setlocal foldenable
    normal! zM
    let s:fold_state = 1
    echo 'FoldToggle: indent'
  elseif s:fold_state == 1
    " state 1 -> 2: drop indent folding, use signify folding
    setlocal foldmethod=manual
    normal! zE
    SignifyFold!
    let s:fold_state = 2
    echo 'FoldToggle: signify'
  else
    " state 2 -> 0: drop signify folding, back to no folding
    SignifyFold!
    setlocal nofoldenable
    let s:fold_state = 0
    echo 'FoldToggle: none'
  endif
endfunction

function! GitFold()
  setlocal foldmethod=manual
  setlocal foldenable
  call sy#fold#enable(0)
endfunction

command! GitFold call GitFold()

" ---------------------------------------------------------------------------}}}

"set foldmethod=indent
"set nofoldenable
