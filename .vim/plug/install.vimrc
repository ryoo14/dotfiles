if !filereadable('~/.vim/autoload/plug.vim')
  call system('curl -fLo ~/.vim/autoload/plug.vim --create-dir ' 
    \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
endif

let g:ryoo_plugin_dir='~/.vim/plug'
call plug#begin(g:ryoo_plugin_dir . '/plugins')
" filetype
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'elzr/vim-json', { 'for': ['json', 'jsonc'] }
Plug 'neoclide/jsonc.vim', { 'for': 'jsonc' }
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
Plug 'tribela/vim-transparent'
Plug 'ryoo14/nautitwilight.vim'
" filer
Plug 'mattn/vim-molder'
Plug 'junegunn/fzf.vim'
" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" utility
Plug 'mattn/sonictemplate-vim'
Plug 'mattn/vim-maketable'
" preview file
Plug 'kannokanno/previm', { 'for': 'markdown' }
Plug 'tyru/open-browser.vim'
" git
Plug 'airblade/vim-gitgutter' " display diff
Plug 'tpope/vim-fugitive'     " git commands
" etc 
Plug 'cohama/lexima.vim'  " auto close parentheses
Plug 'vim-jp/vimdoc-ja'   " help in japanese
Plug 'github/copilot.vim' " github copilot
call plug#end()

filetype plugin indent on
syntax on
