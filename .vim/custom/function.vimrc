" ---------------------------- fzf + patty -------------------------------
command! -nargs=0 Fq call fzf#run({
\ 'source': 'patty list --full-path',
\ 'down': 20,
\ 'sink': 'cd'
\ })


" ---------------------------- fzf + vimrcs ----------------------------
command! -nargs=0 Fc call fzf#run({
\ 'source': "cat " . $MYVIMRC . " | grep source | awk '{print $2}'",
\ 'down': 20,
\ 'sink': 'edit'
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

function LunchSTerminal()
  highlight Terminal ctermbg=NONE guibg=NONE
  execute 'bo terminal ++rows=15'
endfunction
function LunchVTerminal()
  highlight Terminal ctermbg=NONE guibg=NONE
  execute 'vert terminal ++cols=60'
endfunction
function LunchTTerminal()
  highlight Terminal ctermbg=NONE guibg=NONE
  execute 'tab terminal'
endfunction


" ---------------------------- translate ---------------------------
command! -nargs=1 TransJa call TransJa(<q-args>)
function! TransJa(word)
  echo system('echo ' . a:word . ' | trans ja:en -b')
endfunction

command! -nargs=1 TransEn call TransEn(<q-args>)
function! TransEn(word)
  echo system('echo ' . a:word . ' | trans en:ja -b')
endfunction
