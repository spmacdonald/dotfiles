set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

" let Vundle manage Vundle, required
" git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'gmarik/vundle'

" Navigation
Bundle 'kien/ctrlp.vim'
" UI Additions
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Rykka/colorv.vim'
Bundle 'mutewinter/ir_black_mod'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'benmills/vimux'
Bundle 'julienr/vimux-pyutils'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
" Automatic Helpers
Bundle 'IndexedSearch'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'gregsexton/MatchTag'
" Language Additions
Bundle 'pangloss/vim-javascript'
Bundle 'itspriddle/vim-jquery'
Bundle 'mutewinter/taskpaper.vim'
Bundle 'leshill/vim-json'
Bundle 'vim-scripts/indentpython.vim'
Bundle 'vim-scripts/python.vim'
Bundle 'vim-scripts/RST-Tables'
Bundle 'jnwhiteh/vim-golang'
Bundle 'sophacles/vim-processing'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'

filetype plugin indent on

" Platform Specific Configuration
if has('win32') || has('win64')
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10:cANSI
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  set guifont=Menlo\ Regular:h14
  " Hide Toolbar in MacVim
  if has("gui_running")
    set guicursor=n-v-c:block-Cursor-blinkon0
    set guicursor+=ve:ver35-Cursor
    set guicursor+=o:hor50-Cursor
    set guicursor+=i-ci:ver25-Cursor
    set guicursor+=r-cr:hor20-Cursor
    set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

    " Don't display the menu or toolbar
    set guioptions-=m
    set guioptions-=T

    " Remove the scrollbars
    set guioptions-=r
    set guioptions-=l
    set guioptions-=L

  endif
endif

" Color
set background=dark
colorscheme jellybeans

" Backups
set nobackup
set nowritebackup

" UI
set fillchars=""
set laststatus=2  " Always show the statusline
set mousehide
set scrolloff=8
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
set showcmd
set showmode
set number

" Behaviors
syntax enable
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set wildignore+=*.o,*.obj,*.pyc,.git,build/**,doc/build/**,*.swp
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
" set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=250     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set vb
set wrap linebreak textwidth=0

" Text Format
set tabstop=4
set backspace=2 " Delete everything with backspace
set shiftwidth=4  " Tabs under smart indent
set softtabstop=4
set cindent
set autoindent
set smarttab
set smartindent
set expandtab

" Searching
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search
set incsearch
set hlsearch

" Visual
set showmatch  " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" Sounds
set vb

" Mouse
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" Avoid the ESC key
inoremap jj <Esc>

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Fixes common typos
command W w
command Q q
map <F1> <Esc>
imap <F1> <Esc>

" Set leader to ,
let mapleader=","

" Toggle highlighting
nmap <silent> <leader>n :set invhls<CR>:set hls?<CR>

" Underlining
nmap <silent> <leader>ul :t.\|s/./=/g\|set nohls<cr>
nmap <silent> <leader>ull :t.\|s/./-/g\|set nohls<cr>
nmap <silent> <leader>uls :t.\|s/./*/g\|set nohls<cr>

" Mappings
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>
nmap <silent> <leader>sv :source ~/.vim/vimrc<CR>

" Truncate floats to 6 decimal places
nmap <silent> <leader>tf :%s/\([-+]\?[1-9]*\.\d\d\d\d\d\d\)[0-9]*/\1/g<CR>

" Auto Commands
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Save when focus is lost
autocmd FocusLost * :wa

autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" delimitMate
let loaded_delimitMate=1

" Nerd Commenter
let NERDSpaceDelims=1

" Vundle
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bi! :BundleInstall!<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>

let g:ctrlp_use_caching=0

" Go stuff
set rtp+=/usr/local/go/misc/vim

" Syntastic options
let g:syntastic_python_checker_args = '--ignore=E501,W806'

" Snippets
imap <F2> import pdb;pdb.set_trace()<CR>
imap <F3> import code; code.interact(local=locals())<CR>

" Powerline
" let g:Powerline_symbols='fancy'
