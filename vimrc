language en_US.utf8
set langmenu=en_US.utf8
set encoding=utf-8
scriptencoding utf-8

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-syntastic/syntastic'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc' " required for vim-easytags
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --ts-completer --cs-completer --go-completer --rust-completer --java-completer' }
Plug 'davidhalter/jedi'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'TovarishFin/vim-solidity'
Plug 'vim-latex/vim-latex'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'voldikss/vim-floaterm'
"" ----- colorschemes -----
Plug 'junegunn/seoul256.vim'
Plug 'vim-scripts/dante.vim'
Plug 'vim-scripts/zenburn'
call plug#end()

"" ----- general options -----
filetype plugin indent on

set nocompatible

"" ----- environment -----
set path+=/usr/local/include,/usr/lib/python3
set browsedir=buffer
set backup
set writebackup
set directory=~/tmp,.,~/ " swap dir
set backupdir=~/tmp,.,~/ " backup dir
set backupskip=/tmp/*,~/tmp/* " path patterns to skip backup
" set undodir=~/tmp,.,~/ " undo history file
set autoread
set nomodeline
set history=1000
set undolevels=1000
set tabpagemax=50
set sessionoptions+=options
set viminfo='50,<1000,s100,%
set clipboard+=unnamedplus " yank/paste integrated with copy/paste
set ttimeoutlen=100
set ttyfast

set errorbells " configure on term and test with 'tput bel'
"set visualbell " not working
set belloff=backspace " not working
set guioptions=acdigtrb
if has("gui_running")
    set mousehide
    if has("unix")
        set guifont=Monospace\ Regular\ 18
    endif
endif

"" ----- appearance -----
syntax on
set hlsearch
set incsearch
colorscheme seoul256
set background=dark
packadd! matchit
set list
set listchars+=tab:··
set listchars+=trail:·
set listchars+=nbsp:+
set listchars+=extends:»
set listchars+=precedes:«
set showbreak=>
set report=1
set shortmess=atTIoO
set laststatus=2
set tabstop=4
set linebreak
set title
set winheight=5
set textwidth=78
set wrap
set scrolloff=1
set sidescrolloff=3
set diffopt+=algorithm:patience
set fillchars=vert:│,fold:·
set display+=lastline
set number

"" ----- navigation -----
set mouse=a
set showmatch
set matchpairs+=<:>
set matchtime=3
set ignorecase
set smartcase
set showcmd
set wildmenu
set wildoptions+=tagfile
set switchbuf=useopen,usetab,newtab
set splitbelow
set splitright
set langnoremap

"" ----- edit -----
set autoindent
set smartindent
set indentkeys+=then,=do,=else,=elif,=esac,=fi,=fin,=fil,=done
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set noconfirm
set formatoptions+=nl " default = tcqj
set complete=.,w,b,u,t,i

"" ----- vim-easytags settings -----
set tags=./tags;,~/.vim/tags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_include_members = 1
let g:easytags_suppress_ctags_warning = 1

"" ----- syntastic settings -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" ----- youcompleteme settings -----
let g:ycm_confirm_extra_conf = 0
"let g:ycm_seed_identifiers_with_syntax = 1 " XXX crash opening some C/C++ files
let g:ycm_collect_identifiers_from_tags_files = 1

"" ----- airline settings -----
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_close_button = 0

"" ----- airline and devicons fonts settings -----
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.colnr = ' c:'
let g:airline_symbols.linenr = ' l:'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_section_z = '☰  %p%% %l(%L):%c'

"" ----- fugitive settings -----
set statusline+=%{FugitiveStatusline()}

"" ----- fzv settings -----
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

"" ----- floaterm settings -----
let g:floaterm_position = 'bottomright'
let g:floaterm_width = 0.5
let g:floaterm_height = 0.6
"
"" ----- jedi settings -----
let g:ycm_autoclose_preview_window_after_completion=1

"" ----- mappings -----
let g:floaterm_keymap_toggle = '<F4>'
nnoremap <F5> :FZF<cr>
nnoremap <F6> :NERDTreeToggle<cr>
nnoremap <F7> :UndotreeToggle<cr>
nnoremap <F8> :TagbarToggle<cr>
nnoremap <F9> :set invlist<cr>
nnoremap <c-leftmouse> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <s-down>       <c-w>j
nnoremap <s-up>         <c-w>k
nnoremap <s-left>       <c-w>h
nnoremap <s-right>      <c-w>l
nnoremap <c-s-right>    :bnext<cr>
nnoremap <c-s-left>     :bprev<cr>

