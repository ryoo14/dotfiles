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
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'w0ng/vim-hybrid'

" 補完機能自動選択
function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
endfunction

if s:meet_neocomplete_requirements()
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundleFetch 'Shougo/neocomplcache.vim'
else
    NeoBundleFetch 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neocomplcache.vim'
endif

" 補完機能詳細
if s:meet_neocomplete_requirements()
    let g:neocomplete#enable_at_startup = 1
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
    let g:neocomplete#enable_cursor_hold_i = 1
else
    " 今までの neocomplcache の設定
    let g:neocomplcache_enable_at_startup = 1
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
    let g:neocomplcache_enable_cursor_hold_i = 1
endif

" vimprocのauto install
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""

"読みこんだpluginも含め、ファイルタイプの検出、
"ファイルタイプ別プラグイン/インデントを有効化
filetype plugin indent on     " required!
filetype indent on
syntax on

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
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'
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
nmap uf :Unite
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

" Unite関連
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
