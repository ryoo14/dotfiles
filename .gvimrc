if has ('mac')
  set guifont=Ricty:h16
elseif has ('unix')
  set guifont=Ricty\ Regular\ 11
endif

" options
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set lines=90 columns=200  " window size
set notitle

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
