set encoding=utf-8
scriptencoding utf-8
set autoindent
set smartindent
set colorcolumn=79
set relativenumber
set noruler
set laststatus=1
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
set helplang=ja,en
set belloff=all
set t_ut=
set t_Co=256
set shell=bash

aug filetypeset
  au!
  au FileType vim,ruby,html,yaml,json,sh
        \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
aug END

aug grepwindow
  au!
  au QuickFixCmdPost vimgrep cwindow
aug END
