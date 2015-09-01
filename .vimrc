scriptencoding utf-8

"---------------------------------------------------------------
" key-map
"---------------------------------------------------------------
nnoremap ev :edit $MYVIMRC
nnoremap rv :source $MYVIMRC
nnoremap install :NeoBundleInstall
nnoremap update :NeoBundleUpdate
nnoremap clean :NeoBundleClean
nnoremap uf :Unite file
nnoremap vsh :VimShell
nnoremap w3m :W3m google
nnoremap tw :PosttoTwitter<CR>
nnoremap tl :FriendsTwitter<CR><c-w>k
nnoremap ts :SearchTwitter 
nnoremap tlr :RepliesTwitter<CR>
nnoremap tree :NERDTreeToggle
nnoremap mark :PrevimOpen

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
nnoremap / /\v

set very magic

" buff change
nnoremap ,1   :e #1<CR>
nnoremap ,2   :e #2<CR>
nnoremap ,3   :e #3<CR>
nnoremap ,4   :e #4<CR>
nnoremap ,5   :e #5<CR>
nnoremap ,6   :e #6<CR>
nnoremap ,7   :e #7<CR>
nnoremap ,8   :e #8<CR>
nnoremap ,9   :e #9<CR>

" no use
nnoremap ZZ <nop>
nnoremap <c-z> <nop>

"---------------------------------------------------------------
" options
"---------------------------------------------------------------
" タブライン
set showtabline=2

" タブ関連
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" ステータスライン
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
NeoBundle 'Shougo/vimproc.vim', {
\   'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'VimClojure'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'wombat256.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'TwitVim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
call neobundle#end()



filetype plugin indent on
syntax on

"---------------------------------------------------------------
" neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:neocomplete#enable_cursor_hold_i = 1

"---------------------------------------------------------------
" neosnippet
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif

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
" color 
colorscheme wombat256mod 

let g:lightline = {
\   'colorscheme': 'wombat',
\} 

"---------------------------------------------------------------
" indentLine
let g:indentLine_char = '¦'
let g:indentLine_color_term = 7

"---------------------------------------------------------------
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

nnoremap <silent> <c-z> :call W3mOpen()<CR>

"---------------------------------------------------------------
" cursol line 
augroup cursor-line
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

"---------------------------------------------------------------
" filetype setting
augroup filetypes
  autocmd!
  autocmd FileType vim,html,sh,rb,pl set ts=2 sw=2 sts=2
augroup END

"--------------------------------------------------------------
" Vimshell
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

"--------------------------------------------------------------
" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']

"--------------------------------------------------------------
" TwitVim
augroup twitvim_setting
  autocmd!
  autocmd FileType twitvim call s:twitvim_my_settings()
  function! s:twitvim_my_settings()
    "set nowrap
    nnoremap tn :NextTwitter
    nnoremap tp :PreviousTwitter
    nnoremap tr :RefreshTwitter<CR>
  endfunction
augroup END

let g:twitvim_count = 37
"--------------------------------------------------------------
" vim-markdown
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"--------------------------------------------------------------
" vim-markdown
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

"--------------------------------------------------------------
" VimEnter
" augroup vimenter
"   autocmd!
"   autocmd VimEnter * nested if @% == '' && s:GetBufByte() == 0 | execute ":VimShell" | endif
"   function! s:GetBufByte()
"     let byte = line2byte(line('$') + 1)
"     if byte == -1
"       return 0
"     else
"       return 1
"     endif
"   endfunction
" augroup END
