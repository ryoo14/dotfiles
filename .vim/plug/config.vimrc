" vim-json
let g:vim_json_syntax_conceal = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:markdown_recommended_style = 0

" lightline
let g:lightline = {'colorscheme' : 'nautitwilight'}

" indentline
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" previm
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
nnoremap <Leader>md :PrevimOpen

" fugitive
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gps :Git push<CR>
nnoremap <Leader>gpl :Git pull<CR>
nnoremap <Leader>gl :Git log<CR>
nnoremap <Leader>gd :Git diff<CR>
nnoremap <Leader>gg :Git 

" sonictemplate
let g:sonictemplate_vim_template_dir = g:ryoo_plugin_dir . '/plugins/sonictemplate-vim/template'

" fzf
set rtp+=$HOME/.fzf
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': 'ag --hidden --ignore .git -U -g ""'}), <bang>0)
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffer<CR>
nnoremap <Leader>fgs :GFiles?<CR>
nnoremap <Leader>ft :Tags<CR>
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

" snippets
for mode in ['i', 's']
  execute mode . 'map <expr> <C-k> vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-k>"'
  execute mode . 'map <expr> <Tab> vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"'
  execute mode . 'map <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"'
endfor

let g:vsnip_snippet_dir = expand(g:ryoo_plugin_dir . '/snippets')

" vim-molder
let g:molder_show_hidden = 1

" vim-transparent
nnoremap <Leader>tg :TransparentToggle<CR>
