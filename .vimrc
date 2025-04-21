""
" basic settings
""

set encoding=utf-8
scriptencoding utf-8
set autoindent
set smartindent
set relativenumber
set number
set noruler
set laststatus=2
set showtabline=1
set cmdheight=1
set backspace=indent,eol,start
set showmatch
set nohlsearch
set incsearch
set ignorecase
set backup
set backupdir=~/.vim/backup
set noswapfile
set undofile
set undodir=~/.vim/undo
set keywordprg=:help
set helplang=ja,en
set belloff=all
set shell=bash
set splitright
set termguicolors
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
let mapleader = "\<Space>"

""
" keymaps
""

nnoremap <Leader>ev :edit $MYVIMRC
nnoremap <Leader>rv :source $MYVIMRC
noremap j gj
noremap k gk
nnoremap ZZ <nop> "disable Z
nnoremap <c-z> <nop>
nnoremap * *N
nnoremap <Leader>fi :edit .<CR>
nnoremap x "_x
inoremap <C-l> <C-g>U<Right>
nnoremap q: :q
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" like bash in cmdline mode
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-y> <C-r>*

" call custom function
nnoremap <silent> <Leader>ts :call LaunchSTerminal()<CR>
nnoremap <silent> <Leader>tv :call LaunchVTerminal()<CR>
nnoremap <silent> <Leader>tt :call LaunchTTerminal()<CR>
nnoremap <Leader>fq :Fq<CR>
nnoremap <Leader>tj :TransJa 
nnoremap <Leader>te :TransEn 
nnoremap <Leader>hi :call ShowHighlightGroup()<CR>

" tab
nnoremap <silent> <Leader>tn :tabnew<CR>
nnoremap <silent> <Leader>tc :tablast <bar> tabnew<CR>
for n in range(1, 9)
  execute 'nnoremap <silent> <Leader>t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
nnoremap <C-\> gt
tnoremap <C-\> <C-w>gt

" fix display in bottom
noremap <expr> <C-f> 
  \ max([winheight(0) - 2, 1]) . "\<C-d>"
  \ . (line('.') > line('$') - winheight(0) ? 'L' : 'H')

" quickfix
nnoremap <silent> <Leader>co :copen<CR>
nnoremap <silent> <Leader>cc :cclose<CR>
nnoremap <silent> <Leader>cn :cnext<CR>
nnoremap <silent> <Leader>cp :cprev<CR>

" paste dir path of current buffer
cnoremap <C-x> <C-r>=expand('%:p:h')<CR>

""
" plugin settings
""

let s:vim_dir='~/.vim'

" install plug.vim
if !filereadable(s:vim_dir . '/autoload/plug.vim')
  call system('curl -fLo ' . s:vim_dir . '/autoload/plug.vim --create-dir ' 
    \ . 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
endif

" install plugins
call plug#begin(s:vim_dir . '/plugins')
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

" vim-json
let g:vim_json_syntax_conceal = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:markdown_recommended_style = 0

" lightline
let g:lightline = {'colorscheme' : 'nautitwilight'}

" indentline
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" previm
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
nnoremap <Leader>md :PrevimOpen

" fugitive
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gps :Git push<CR>
nnoremap <Leader>gpl :Git pull<CR>
nnoremap <Leader>gl :Git log<CR>
nnoremap <Leader>gd :Git diff<CR>
nnoremap <Leader>gg :Git 

" sonictemplate
let g:sonictemplate_vim_template_dir = s:vim_dir . '/templates'

" fzf
set rtp+=$HOME/.fzf
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': 'ag --hidden --ignore .git -U -g ""'}), <bang>0)
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffer<CR>
nnoremap <Leader>fgs :GFiles?<CR>
nnoremap <Leader>ft :Tags<CR>
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

" snippets
for mode in ['i', 's']
  execute mode . 'map <expr> <C-k> vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-k>"'
  execute mode . 'map <expr> <Tab> vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"'
  execute mode . 'map <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"'
endfor

let g:vsnip_snippet_dir = expand(s:vim_dir . '/snippets')

" vim-molder
let g:molder_show_hidden = 1

" vim-transparent
nnoremap <Leader>tg :TransparentToggle<CR>

" lsp settings
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_document_highlight_enabled = 0
nnoremap <expr> <C-]> execute('LspDefinition') =~ "not supported" ? "\<C-]>" : ":LspDefinition<cr>"
nnoremap <silent> <Leader>ls :rightbelow split \| :LspDefinition <CR>
nnoremap <silent> <Leader>lv :rightbelow vsplit \| :LspDefinition <CR>
nnoremap <silent> <Leader>lh :LspHover<CR>
nnoremap <silent> <Leader>lr :LspReferences<CR>
nnoremap <silent> <Leader>li :LspImplementation<CR>
nnoremap <silent> <Leader>ln :LspRename<CR>
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server', 'deno']
let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server', 'deno']

let g:lsp_settings = {
\  'typeprof': {'disabled': 1},
\}

" color
set background=dark
colorscheme nautitwilight

""
" custom functions
""

" ---------------------------- fzf + patty -------------------------------
command! -nargs=0 Fq call fzf#run({
\ 'source': 'patty list --full-path | sort',
\ 'down': 20,
\ 'sink': 'cd',
\ 'window': {'width': 0.9, 'height': 0.6}
\ })

" ---------------------------- select commit message -------------------
function! Select_commit_type() abort
  let line = substitute(getline('.'), '^#\s*', '', 'g')
  let title = printf('%s: ', split(line, ' ')[0])

  silent! normal! "_dip
  silent! put! =title
  silent! startinsert!
endfunction

augroup select-commit-message
  autocmd!
  autocmd Filetype gitcommit nnoremap <buffer> <CR><CR> :call Select_commit_type()<CR>
augroup END

" -------------------------- launch terminal -----------------------
function LaunchSTerminal()
  highlight Terminal ctermbg=NONE guibg=NONE
  execute 'bo terminal ++rows=15'
endfunction
function LaunchVTerminal()
  highlight Terminal ctermbg=NONE guibg=NONE
  execute 'vert terminal ++cols=60'
endfunction
function LaunchTTerminal()
  highlight Terminal ctermbg=NONE guibg=NONE
  execute 'tab terminal'
endfunction


" ---------------------------- translate ---------------------------
command! -nargs=1 TransJa call TransJa(<q-args>)
function! TransJa(word)
  let l:transWord = system('echo ' . a:word . ' | trans ja:en -b')
  let @" = substitute(l:transWord, '\n\+$', '', '')
  echo l:transWord
endfunction

command! -nargs=1 TransEn call TransEn(<q-args>)
function! TransEn(word)
  let l:transWord = system('echo ' . a:word . ' | trans en:ja -b')
  let @" = substitute(l:transWord, '\n\+$', '', '')
  echo l:transWord
endfunction

" ---------------------------- show highlight group ---------------------------
function! ShowHighlightGroup()
  let l:higname = synIDattr(synID(line("."), col("."), 1), "name")
  let @" = l:higname
  echo l:higname
endfunction
