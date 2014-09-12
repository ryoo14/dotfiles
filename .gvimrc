" カラースキーム
colorscheme hybrid
syntax enable

set transparency=10
set guifont=Ricty:h16
set lines=90 columns=200

" 背景の透過
set transparency=0 " initialize                                                                                       
nnoremap <expr><F5> &transparency+20 >= 30 ? ":set transparency=0\<CR>" : ":let &transparency=&transparency+20\<CR>"

set guioptions-=r
set guioptions-=L

let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#262626 ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=4
let g:indent_guides_guide_size=1


