scriptencoding utf-8

"---------------------------------------------------------------
" key-map
"---------------------------------------------------------------
nnoremap ,ev :edit $MYVIMRC
nnoremap ,rv :source $MYVIMRC

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
nnoremap <Tab> % 
vnoremap <Tab> %
nnoremap / /\v

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

" ESC
inoremap jj <ESC>

" no use
nnoremap ZZ <nop>
nnoremap <c-z> <nop>

"---------------------------------------------------------------
" options
"---------------------------------------------------------------
" show tab
" set showtabline=2

" indent and space
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

" show status line
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
set clipboard=unnamed,autoselect

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
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'VimClojure'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'wombat256.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'yuratomo/w3m.vim'
NeoBundle 'TwitVim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'elzr/vim-json'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'jcfaria/Vim-R-plugin'
NeoBundle 'NigoroJr/rsense'
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
\ 'autoload' : { 'insert' : 1, 'filetype' : 'ruby', } }
NeoBundle 'mopp/AOJ.vim'
NeoBundle 'mattn/webapi-vim'
call neobundle#end()

filetype plugin indent on
syntax on

"---------------------------------------------------------------
" NeoBundle
nnoremap ,inst :NeoBundleInstall
nnoremap ,up :NeoBundleUpdate
nnoremap ,cl :NeoBundleClean

"---------------------------------------------------------------
" neocomplete
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:neocomplete#enable_cursor_hold_i = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

let g:rsenseUseOmniFunc = 1

let g:neocomplete#sources#dictionary#dictionaries = {
      \   'ruby': $HOME . '/dotfiles/.vim/dicts/ruby.dict',
      \ }

"---------------------------------------------------------------
" neosnippet
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=0 concealcursor=i
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

nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uo :<C-u>Unite outline -vertical -winwidth=35 -no-quit<CR>
let g:unite_split_rule = 'botright'

"---------------------------------------------------------------
" color schema
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
" filetype setting
augroup filetypes
  autocmd!
  autocmd FileType vim,html,sh,Ruby,perl set ts=2 sw=2 sts=2
augroup END

"--------------------------------------------------------------
" Vimshell
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

nnoremap ,sh :VimShell

"--------------------------------------------------------------
" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_ruby_checkers = ['rubocop']

"--------------------------------------------------------------
" TwitVim
let g:twitvim_count = 40 
let twitvim_timestamp_format = '%H:%M'
nnoremap ,tw :PosttoTwitter<CR>
nnoremap ,tl :FriendsTwitter<CR>
nnoremap ,ts :SearchTwitter 
nnoremap ,tt :RepliesTwitter<CR>
nnoremap ,tn :NextTwitter<CR>
nnoremap ,tp :PreviousTwitter<CR>
nnoremap ,tr :RefreshTwitter<CR>

"--------------------------------------------------------------
" vim-markdown
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:vim_markdown_folding_disabled = 1
set conceallevel=0
nnoremap ,md :PrevimOpen

"--------------------------------------------------------------
" quick-run
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

"--------------------------------------------------------------
" vimfiler
let g:vimfiler_as_default_explorer=1
let g:vimfiler_enable_auto_cd = 1

nnoremap ,fi :VimFiler -split -simple -create -winwidth=30 -no-quit<CR>

"--------------------------------------------------------------
" vim-json
let g:vim_json_syntax_conceal = 0

"--------------------------------------------------------------
" hide tmux's status line to start or exit vim
if !has('gui_running') && $TMUX !=# ''
    augroup Tmux
        autocmd!
        autocmd VimEnter,VimLeave * silent !tmux set status
    augroup END
endif

"--------------------------------------------------------------
" R
let vimrplugin_vsplit = 1

"--------------------------------------------------------------
" AOJ
let g:aoj#user_id = 'ryoana14'

nnoremap ,aov :AOJViewProblem<CR>
nnoremap ,aos :AOJSubmit<CR>
nnoremap ,aol :AOJViewStaticticsLogs<CR>

"--------------------------------------------------------------
" w3m
nnoremap ,w3m :W3m google

