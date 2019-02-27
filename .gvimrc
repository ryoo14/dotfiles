if has ('mac')
  set guifont=Cica:h16
elseif has ('unix')
  set guifont=Cica\ Regular\ 14
elseif has ('win64')
  set guifont=Cica:h12
  source ~/_vimrc
  set nocompatible
  set enc=utf-8
  set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default
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
autocmd GUIEnter * set transparency=220
"let g:lightline = {
"  \ 'colorscheme': 'wombat',
"  \ }
