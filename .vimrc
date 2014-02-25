""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neobundleについてのおまじない
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"neobundle.vimの初期化
call neobundle#rc(expand('~/.vim/bundle/'))
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"読み込むpluginを記載
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"読みこんだpluginも含め、ファイルタイプの検出、
"ファイルタイプ別プラグイン/インデントを有効化
filetype plugin indent on     " required!
filetype indent on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"neocomplete関連の何かしらの設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#enable_at_startup = 1

"候補検索時使用
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:neocomplete#enable_cursor_hold_i = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""
"snippets関連
""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
 set conceallevel=2 concealcursor=i
endif

"neosnippet
let g:neosnippet#snippets_directory='~/.vim/neosnippet-snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#disable_runtime_snippets = {
		\   'c' : 1, 'cpp' : 1,
		\ }
""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim起動中のタブ関連
""""""""""""""""""""""""""""""""""""""""""""""""""""
set showtabline=2 "常にタブラインを表示

""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""
"キーマッピングとか
""""""""""""""""""""""""""""""""""""""""""""""""""""
"キーマップ
nmap tc :tabnew
nmap tree :NERDTree
nmap install :NeoBundleInstall
nmap indent :IndentGuidesToggle
:ab vsh VimShell
:ab uf Unite file

"ウィンドウの切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l 

"ウィンドウサイズの変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

noremap j gj
noremap k gk

inoremap jj <Esc>
nnoremap <Tab> %
vnoremap <Tab> %

set backspace=indent,eol,start
set number
set wildmode=longest,list
let NERDTreeShowHidden = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""
"タブキーの空白をスペース何個分にするか
""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=4 "タブ幅
set shiftwidth=4 "自動インデント幅
set softtabstop=4 "連続した空白削除時
set autoindent "前行インデント継続
set smartindent "前行末尾によって次行判定
""""""""""""""""""""""""""""""""""""""""""""""""""""
"swapとか無効
set nowritebackup
set nobackup
set noswapfile

hi Comment ctermfg=8
