"---------------------------------------------------------------
" key-map
"---------------------------------------------------------------
nnoremap indent :IndentGuidesToggle
nnoremap install :NeoBundleInstall
nnoremap qr :QuickRun
nnoremap tc :tabnew
nnoremap tree :NERDTree
nnoremap tw :PosttoTwitter<CR>
nnoremap tl :FriendsTwitter<CR><c-w>k
nnoremap uf :Unite file
nnoremap vsh :VimShell
nnoremap w3m :W3m google

" change window
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l 

" change window size
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

noremap j gj
noremap k gk

inoremap jj <Esc>
nnoremap <Tab> % 
vnoremap <Tab> %

"---------------------------------------------------------------
" options
"---------------------------------------------------------------
" タブライン
set showtabline=2   " 常にタブラインを表示

" タブ関連
set expandtab
set tabstop=4       " タブ幅
set shiftwidth=4    " 自動インデント幅
set softtabstop=4   " 連続した空白削除時
set autoindent      " 前行インデント継続
set smartindent     " 前行末尾によって次行判定

" status line
set laststatus=2
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%06.6B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" etc
set number
set backspace=indent,eol,start
set wildmode=list,full              " :eなどの補完強化
set cmdheight=1                     " 画面下部のコマンドラインの高さ
set showmatch                       " 括弧の対応をハイライト
set cursorline                      " カーソル行のハイライト
set hlsearch
set nowritebackup
set nobackup
set noswapfile
set noundofile

"---------------------------------------------------------------
" plugin
"---------------------------------------------------------------
" neobundleについてのおまじない
set nocompatible               " be iMproved

" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"neobundle.vimの初期化
call neobundle#rc(expand('~/.vim/bundle/'))


"---------------------------------------------------------------
NeoBundle 'Shougo/vimproc', {
\   'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'VimClojure'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'wombat256.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'TwitVim'
NeoBundle 'thinca/vim-quickrun'
"---------------------------------------------------------------

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
    " neocomplcache の設定
    let g:neocomplcache_enable_at_startup = 1
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
    let g:neocomplcache_enable_cursor_hold_i = 1
endif

filetype plugin indent on
syntax on

"snippets関連
"imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
 set conceallevel=2 concealcursor=i
endif

" neosnippet
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#disable_runtime_snippets = {
		\   'c' : 1, 'cpp' : 1,
		\ }

" Unite関連
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200

" Tree関連
let NERDTreeShowHidden = 1  " 隠しファイルも表示

" Status Line
let g:lightline = {
\   'colorscheme': 'wombat',
\}

" TwitVim関連
autocmd FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
  set nowrap
  nnoremap tn :NextTwitter
  nnoremap tr :RefreshTwitter
endfunction

" color scheme
colorscheme wombat256mod

" indentLine
let g:indentLine_char = '¦'
let g:indentLine_color_term = 7

" VimShell
let g:vimshell_right_prompt = 'getcwd()'
