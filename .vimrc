scriptencoding utf-8

"---------------------------------------------------------------
" key-map
"---------------------------------------------------------------
" edit .vimrc
nnoremap ,ev :edit $MYVIMRC
nnoremap ,rv :source $MYVIMRC
nnoremap ,egv :edit $MYGVIMRC
nnoremap ,rgv :source $MYGVIMRC

noremap j gj
noremap k gk
nnoremap / /\v

" ESC
inoremap jj <ESC>

" no use
nnoremap ZZ <nop>
nnoremap <c-z> <nop>

" etc mappning
noremap <expr> <C-f> 
  \ max([winheight(0) - 2, 1]) . "\<C-d>" 
  \ . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
nnoremap <C-]> :exe("tjump ".expand('<cword>'))<CR>

"---------------------------------------------------------------
" options
"---------------------------------------------------------------
" exchange space to tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" enable smart indent
set autoindent
set smartindent

" visible 80th column
set colorcolumn=79

" display line number
set number

" always display status line
set laststatus=2
" display tab line when two or more tabs
set showtabline=1

" backspace can delete indent and newline
set backspace=indent,eol,start

set wildmode=list,full

" command line height
set cmdheight=1
set showmatch

" not highlight for search result
set nohlsearch

" not get backup and swapfile
set nobackup
set noswapfile
" get undofile
set undofile
set undodir=~/tmp

set keywordprg=:help
set clipboard=unnamed

" disable bells
set novisualbell
set belloff=all

set t_ut=

"---------------------------------------------------------------
" plugin
"---------------------------------------------------------------
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
" auto install if not exist dein.vim
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' 
      \ . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath

" load plugins
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.vim/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" auto install if not exist etc plugins
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on

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
      \   'lisp': $HOME . '/dotfiles/.vim/dicts/lisp.dict',
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
" indentLine
let g:indentLine_char = '¦'
let g:indentLine_color_term = 7

"--------------------------------------------------------------
" Vimshell
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

nnoremap ,sh :VimShell

"--------------------------------------------------------------
" syntastic
" TODO: fix
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
let g:syntastic_ruby_checkers = ['rubocop']

"--------------------------------------------------------------
" vim-markdown
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

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

"---------------------------------------------------------------
" lightline
set background=dark
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \}

"---------------------------------------------------------------
" tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

map <silent> ,tc :tablast <bar> tabnew<CR>

"---------------------------------------------------------------
" vim-fugitive
nnoremap ,gs :Gstatus<CR>
nnoremap ,gc :Gcommit<CR>

"---------------------------------------------------------------
" slime
let g:slime_target = "screen"

"---------------------------------------------------------------
"lexima
inoremap <C-l> <C-g>U<Right>
