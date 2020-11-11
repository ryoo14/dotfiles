command! -nargs=0 Fq call fzf#run({
\ 'source': 'ghq list --full-path',
\ 'down': 20,
\ 'sink': 'cd'
\ })
