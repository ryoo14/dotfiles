let mapleader = "\<Space>"

nnoremap <Leader>ev :edit $MYVIMRC
nnoremap <Leader>rv :source $MYVIMRC
nnoremap <Leader>egv :edit $MYGVIMRC
nnoremap <Leader>rgv :source $MYGVIMRC
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

" terminal
" nnoremap <silent> <Leader>ts :bo terminal ++rows=15<CR>
" nnoremap <silent> <Leader>tv :vert terminal<CR>
" nnoremap <silent> <Leader>tt :tab terminal<CR>

" custom function
nnoremap <silent> <Leader>ts :call LaunchSTerminal()<CR>
nnoremap <silent> <Leader>tv :call LaunchVTerminal()<CR>
nnoremap <silent> <Leader>tt :call LaunchTTerminal()<CR>
nnoremap <silent> <Leader>tn :tabnew<CR>
nnoremap <Leader>fq :Fq<CR>
nnoremap <Leader>fc :Fc<CR>
nnoremap <Leader>tj :TransJa 
nnoremap <Leader>te :TransEn 
nnoremap <Leader>hi :call ShowHighlightGroup()<CR>

" tab
nnoremap <silent> <Leader>tc :tablast <bar> tabnew<CR>
for n in range(1, 9)
  execute 'nnoremap <silent> <Leader>t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" fix display in bottom
noremap <expr> <C-f> 
  \ max([winheight(0) - 2, 1]) . "\<C-d>" 
  \ . (line('.') > line('$') - winheight(0) ? 'L' : 'H')

" paste dir path of current buffer
cnoremap <C-x> <C-r>=expand('%:p:h')<CR>

" tab control
nnoremap <C-\> gt
tnoremap <C-\> <C-w>gt
