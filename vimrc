"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim script
" File: "/home/caciano/.vimrc"
" Created: "Thu, 23 May 2002 11:34:31 -0300 (caciano)"
" Updated: "Fri, 20 Jan 2016 22:32:14 -0300 (caciano)"
" Copyright (C) 2002, Caciano Machado <caciano.machado@ufrgs.br>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

scriptencoding utf-8
set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug '~/my-prototype-plugin'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/vim-github-dashboard', { 'on': ['GHDashboard', 'GHActivity'] }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }
Plug 'Valloric/YouCompleteMe', { 'for': 'cpp' }
autocmd! User YouCompleteMe call youcompleteme#Enable()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/perl-support.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-bufferline'
Plug 'bling/vim-airline'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'

" Colorschemes
Plug 'vim-scripts/dante.vim'
Plug 'vim-scripts/zenburn'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Options:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme seoul256
"colorscheme base16-twilight
"colorscheme zenburn
set background=dark
filetype plugin indent on
syntax on

set nocompatible " set a lot of options
set autoindent
set smartindent
set indentkeys+=0{,0},!^F,o,O,e,=then,=do,=else,=elif,=esac,=fi,=fin,=fil,=done
set undolevels=1000
set backspace=indent,eol,start
set backup
set display=lastline
set formatoptions=tcq2
set hlsearch
set mouse=a
set diffopt+=vertical
set incsearch
set linebreak
set breakat=" ^I!@*-+;:,./\?"
set list
set listchars+=eol:¬
set listchars+=tab:··
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
map <silent> <F12> :set invlist<CR>
set showbreak=>
set matchpairs=(:),[:],{:},<:>
set matchtime=3
set showmatch
set report=1
set shell=sh
set shortmess=atTIoO
set ignorecase
set smartcase
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set textwidth=78
set wrapmargin=8
set nostartofline
set switchbuf=useopen,split
set title
set ttyscroll=3
set wildmenu
set wildmode=list:longest
set winheight=5
set writebackup
set wrap
set showcmd
set history=100
set ruler
set nonumber
set confirm
set guioptions=acfgirRbtm
set path=/usr/include,/usr/local/include,.
set splitbelow
set splitright
set restorescreen
set sessionoptions=blank,buffers,curdir,folds,help,options,winsize,globals
set viminfo=!,'50,\"100,h,%
set browsedir=current
set clipboard+=unnamed
set novisualbell
set noerrorbells
set vb t_vb=

" swap, backup and backup skip directories
set dir=$HOME/tmp,/tmp
set bdir=$HOME/tmp,/tmp
set bsk=$HOME/tmp/,/tmp/

if has("gui_running")
    colorscheme zenburn
    set mousehide " Hide the mouse when typing text
    map <S-Insert> <MiddleMouse> " shift-insert work like in Xterm
    map! <S-Insert> <MiddleMouse>
    let c_comment_strings=1
    if has("mac")
        set guifont=Monaco:h16
    elseif has("unix")
        set guifont=Inconsolata\ for\ Powerline\ Medium\ 16
    endif
endif

" the cursor always jump to the last known position
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\     exe "normal g`\"" |
\ endif

" jump to buffer dir
if has("autocmd")
  autocmd BufEnter * :lcd %:p:h
endif

" shift + cursor navigate between windows
nmap <s-down>   <c-w>j
nmap <s-up>     <c-w>k
nmap <s-left>   <c-w>h
nmap <s-right>  <c-w>l

" NERDTree
nnoremap <F7> :NERDTreeToggle<cr>

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

nnoremap <F8> :TagbarToggle<cr>
"autocmd BufEnter * nested :call tagbar#autoopen(0)
