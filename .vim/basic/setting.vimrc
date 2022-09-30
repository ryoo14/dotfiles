set encoding=utf-8
scriptencoding utf-8
set autoindent
set smartindent
set relativenumber
set number
set noruler
set laststatus=2
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
set shell=bash
set splitright
set termguicolors

aug filetypeset
  au!
  au FileType vim,ruby,html,yaml,json,sh,markdown,javascript,typescript,typescriptreact,css
        \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType rust 
        \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
aug END

aug grepwindow
  au!
  au QuickFixCmdPost vimgrep cwindow
aug END



" Disable unnecessary default plugins
let g:loaded_spellfile_plugin   = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_rrhelper           = 1
let g:loaded_2html_plugin       = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_logipat            = 1
let g:loaded_matchparen         = 1
let g:loaded_man                = 1
let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_netrwFileHandlers  = 1
let g:loaded_logiPat            = 1
let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:did_install_syntax_menu   = 1
let g:plug_shallow = 0
