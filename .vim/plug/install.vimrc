"if !filereadable('~/.vim/autoload/plug.vim')
"  call system('curl -fLo ~/.vim/autoload/plug.vim --create-dir ' 
"    \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
"endif

let g:ryoo_plugin_dir='~/.vim/plug'
call plug#begin(g:ryoo_plugin_dir . '/plugins')
" filetype
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" vim-lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" color and appearance
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'sainnhe/everforest'
Plug 'tribela/vim-transparent'
Plug 'ghifarit53/tokyonight-vim'
" filer
Plug 'mattn/vim-molder'
Plug 'junegunn/fzf.vim'
" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" quick run
Plug 'mattn/sonictemplate-vim'
" preview file
Plug 'kannokanno/previm', { 'for': 'markdown' }
Plug 'tyru/open-browser.vim'
" git
Plug 'airblade/vim-gitgutter' " display diff
Plug 'tpope/vim-fugitive'     " git commands
" etc 
Plug 'cohama/lexima.vim'  " auto close parentheses
Plug 'vim-jp/vimdoc-ja'   " help in japanese
" lang
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
call plug#end()

filetype plugin indent on
syntax on
