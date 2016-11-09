" color Scheme
"colorscheme hybrid

if has ('mac')
  set guifont=Ricty:h16
elseif has ('unix')
  set guifont=Ricty\ for\ Powerline\ 11
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
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}',
      \ },
      \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
      \ }
