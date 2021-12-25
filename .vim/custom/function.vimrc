" ---------------------------- fzf + ghq -------------------------------
command! -nargs=0 Fq call fzf#run({
\ 'source': 'ghq list --full-path',
\ 'down': 20,
\ 'sink': 'cd'
\ })

nnoremap <Space>fq :Fq<CR>

" ---------------------------- fzf + vimrcs ----------------------------
command! -nargs=0 Fc call fzf#run({
\ 'source': "cat " . $MYVIMRC . " | grep source | awk '{print $2}'",
\ 'down': 20,
\ 'sink': 'edit'
\ })

nnoremap <Space>fc :Fc<CR>

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
