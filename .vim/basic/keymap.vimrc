nnoremap <Space>ev :edit $MYVIMRC
nnoremap <Space>rv :source $MYVIMRC
nnoremap <Space>egv :edit $MYGVIMRC
nnoremap <Space>rgv :source $MYGVIMRC
noremap j gj
noremap k gk
nnoremap ZZ <nop> "disable Z
nnoremap <c-z> <nop>
nnoremap * *N
nnoremap <Space>fi :edit .<CR>
inoremap <C-l> <C-g>U<Right>

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
nnoremap <silent> <Space>ts :bo terminal ++rows=15<CR>
nnoremap <silent> <Space>tv :vert terminal<CR>
nnoremap <silent> <Space>tt :tab terminal<CR>

" tab
nnoremap <silent> <Space>tc :tablast <bar> tabnew<CR>
for n in range(1, 9)
  execute 'nnoremap <silent> <Space>t'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" fix display in bottom
noremap <expr> <C-f> 
  \ max([winheight(0) - 2, 1]) . "\<C-d>" 
  \ . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
