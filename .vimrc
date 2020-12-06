" ---------------------------- General Settings -----------------------------
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

" ----------------------------- Key Remappings ------------------------------
nnoremap <Space>ev :edit $MYVIMRC
nnoremap <Space>rv :source $MYVIMRC
nnoremap <Space>egv :edit $MYGVIMRC
nnoremap <Space>rgv :source $MYGVIMRC
noremap j gj
noremap k gk
nnoremap ZZ <nop> "disable Z
nnoremap <c-z> <nop>
inoremap <C-l> <C-g>U<Right>

" like bash in cmdline mode
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-y> <C-r>*

" terminal
nnoremap <silent> <Space>te :terminal ++rows=15<CR>

" tab
nnoremap <silent> <Space>tc :tablast <bar> tabnew<CR>
for n in range(1, 9)
  execute 'nnoremap <silent> <Space>t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" fix display in bottom
noremap <expr> <C-f> 
  \ max([winheight(0) - 2, 1]) . "\<C-d>" 
  \ . (line('.') > line('$') - winheight(0) ? 'L' : 'H')

autocmd QuickFixCmdPost vimgrep cwindow

" ---------------------------- Plugin Management ----------------------------

if !filereadable('~/.vim/autoload/plug.vim')
  call system('curl -fLo ~/.vim/autoload/plug.vim --create-dir ' 
    \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
endif

let s:plugin_dir='~/.vim/plugged'
call plug#begin(s:plugin_dir)
" filetype
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" vim-lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
" color and appearance
Plug 'ryoo14/coral.vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
" filer
Plug 'mattn/vim-molder'
Plug 'junegunn/fzf.vim'
" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" quick run
Plug 'mattn/sonictemplate-vim'
Plug 'thinca/vim-quickrun'
" preview file
Plug 'kannokanno/previm', { 'for': 'markdown' }
Plug 'tyru/open-browser.vim'
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" etc 
Plug 'cohama/lexima.vim'  " auto close parentheses
Plug 'vim-jp/vimdoc-ja'   " help in japanese
Plug 'kana/vim-tabpagecd'
Plug 'deris/vim-duzzle'
" lang
Plug 'rust-lang/rust.vim'
call plug#end()

source ~/.vim/plugconf/general.vimrc
source ~/.vim/plugconf/lsp.vimrc
source ~/.vim/custom_function.vimrc


" ----------------------------- Color Settings ------------------------------
set background=dark
colorscheme coral

" ---------------------------- Syntax Mappings ------------------------------
