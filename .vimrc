scriptencoding utf-8

"---------------------------------------------------------------
" key-map
"---------------------------------------------------------------
" vimrc編集
nnoremap <Space>ev :edit $MYVIMRC
nnoremap <Space>rv :source $MYVIMRC
nnoremap <Space>egv :edit $MYGVIMRC
nnoremap <Space>rgv :source $MYGVIMRC

" 上下移動
noremap j gj
noremap k gk

" 検索
nnoremap / /\v

" Z無効
nnoremap ZZ <nop>
nnoremap <c-z> <nop>

" <c-f>の最下行表示をなんとかする
noremap <expr> <C-f> 
  \ max([winheight(0) - 2, 1]) . "\<C-d>" 
  \ . (line('.') > line('$') - winheight(0) ? 'L' : 'H')

" タグジャンプ
nnoremap <C-]> :exe("tjump ".expand('<cword>'))<CR>

" タブジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> <Space>tc :tablast <bar> tabnew<CR>

" <c-l>で右へ
inoremap <C-l> <C-g>U<Right>

" コマンドラインモードでbashっぽく動く
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-y> <C-r>*

"---------------------------------------------------------------
" options
"---------------------------------------------------------------
" タブの変換
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" インデントをかしこく
set autoindent
set smartindent

" 80文字
set colorcolumn=79

" 行数の表示
set number

" ステータスラインを常時表示
set laststatus=2
" タブが2つ以上あるときにタブラインを表示
set showtabline=1
" コマンドラインの高さ
set cmdheight=1

" backspace can delete indent and newline
set backspace=indent,eol,start

" 補完
set wildmode=list,full
set completeopt=menuone

" 閉じ括弧の表示
set showmatch

" 検索結果をハイライトさせない
set nohlsearch

" バックアップとか
set nobackup
set noswapfile
set undofile
set undodir=~/tmp

" <s-k>に使うコマンド
set keywordprg=:help

" ベル無効
set belloff=all

set t_ut=

if has('win64')
  set grepprg=grep\ -n
  set autochdir
endif

"---------------------------------------------------------------
" plugin
"---------------------------------------------------------------
"---------------------------------------------------------------
" dein

if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein
let s:cache_home = expand('~/.cache')
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' 
      \ . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath
if has('unix')
  let &runtimepath = '/usr/share/vim/vim81' .",". &runtimepath
endif

let s:toml_file   = fnamemodify(expand('<sfile>'), ':h').'/.vim/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on

set background=dark

" 外部ファイル読み込み
" lsp
source ~/.vim/vimrc-lsp
