set encoding=utf-8
"scriptencoding utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set colorcolumn=79
set number
set noruler
set laststatus=0
set showtabline=1
set cmdheight=1
set backspace=indent,eol,start
set showmatch
set nohlsearch
set incsearch
set ignorecase
set nobackup
set noswapfile
set undofile
set undodir=~/tmp
set keywordprg=:help
set belloff=all
set t_ut=
set t_Co=256
set shell=bash
filetype plugin indent on
syntax on

if has('win64')
  set grepprg=grep\ -n
  set autochdir
endif

autocmd QuickFixCmdPost vimgrep cwindow
