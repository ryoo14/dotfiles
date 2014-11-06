"---------------------------------------------------------------
" key-map
"---------------------------------------------------------------
nnoremap ev :edit $MYVIMRC
nnoremap rv :source $MYVIMRC
nnoremap install :NeoBundleInstall
nnoremap update :NeoBundleUpdate
nnoremap clean :NeoBundleClean
nnoremap qr :QuickRun
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
nnoremap <expr> 0 col('.') == 1 ? '$' : '0'
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

" etc
set number
set backspace=indent,eol,start
set wildmode=list,full
set cmdheight=1
set showmatch
set hlsearch
set nobackup
set noswapfile
set noundofile
set keywordprg=:help
"---------------------------------------------------------------
" plugin
"---------------------------------------------------------------
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
"---------------------------------------------------------------
NeoBundle 'Shougo/vimproc', {
\   'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundleLazy 'Shougo/unite.vim',{
\   'autoload' : { 'commands' : [ 'Unite' ] }
\}
NeoBundleLazy 'Shougo/vimshell', {
\   'autoload' : { 'commands' : [ 'VimShell' ] }
\}
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
call neobundle#end()
filetype plugin indent on
syntax on

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
  let g:neocomplcache_enable_at_startup = 1
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
  let g:neocomplcache_enable_cursor_hold_i = 1
endif

imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" neosnippet
let g:neosnippet#snippets_directory='~/.vim/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#disable_runtime_snippets = {
		\   'c' : 1, 'cpp' : 1,
  	\ }

"---------------------------------------------------------------
" Unite
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_file_mru_limit = 200

"---------------------------------------------------------------
" Tree
let NERDTreeShowHidden = 1  " 隠しファイルも表示

"---------------------------------------------------------------
" Status Line
let g:lightline = {
\   'colorscheme': 'wombat',
\}

"---------------------------------------------------------------
" TwitVim
augroup twitvim_setting
  autocmd!
  autocmd FileType twitvim call s:twitvim_my_settings()
  function! s:twitvim_my_settings()
    set nowrap
    nnoremap tn :NextTwitter
    nnoremap tr :RefreshTwitter<CR>
  endfunction
augroup END

"---------------------------------------------------------------
" color scheme
colorscheme wombat256mod

"---------------------------------------------------------------
" indentLine
let g:indentLine_char = '¦'
let g:indentLine_color_term = 7

"---------------------------------------------------------------
" tab 
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> tc :tablast <bar> tabnew<CR>

"---------------------------------------------------------------
" w3m 
function! W3mOpen()
  let l:url = matchstr(getline('.'), 'https\{0,1}:\/\/[^>,;:]*')
  execute ':vs'
  execute ':W3m' l:url
endfunction

nnoremap <silent> <c-w> :call W3mOpen()<CR>

"---------------------------------------------------------------
" cursol line 
augroup cursor-line
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

"---------------------------------------------------------------
" filetype setting
augroup filetype_vim
  autocmd!
  autocmd FileType vim,html set ts=2 sw=2 sts=2
augroup END

"--------------------------------------------------------------
" Vimshell
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

"--------------------------------------------------------------
" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2

"--------------------------------------------------------------
" VimEnter
augroup vimenter
  autocmd!
  autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | execute ":VimShell" | endif
  function! s:GetBufByte()
    let byte = line2byte(line('$'))
    if byte == -1
      return 0
    else
      return 1
    endif
  endfunction
augroup END
