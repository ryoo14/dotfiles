" fzf + ghq
command! -nargs=0 Fq call fzf#run({
\ 'source': 'ghq list --full-path',
\ 'down': 20,
\ 'sink': 'cd'
\ })

nnoremap <Space>fq :Fq<CR>

" fzf + vimrcs
command! -nargs=0 Fc call fzf#run({
\ 'source': "cat " . $MYVIMRC . " | grep source | awk '{print $2}'",
\ 'down': 20,
\ 'sink': 'edit'
\ })

nnoremap <Space>fc :Fc<CR>
