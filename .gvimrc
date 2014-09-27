" color Scheme
"colorscheme hybrid
"syntax enable


" permeate background
set transparency=0 " initialize                                                                                       
nnoremap <expr><F5> &transparency+20 >= 30 ? ":set transparency=0\<CR>" : ":let &transparency=&transparency+20\<CR>"

" options
set guioptions-=r
set guioptions-=L
set guifont=Ricty:h16     " font
set lines=90 columns=200  " window size
