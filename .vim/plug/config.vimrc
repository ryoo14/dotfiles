" vim-json
let g:vim_json_syntax_conceal = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" lightline
let g:lightline = {'colorscheme' : 'everforest'}

" indentline
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" previm
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
nnoremap <Space>md :PrevimOpen

" fugitive
nnoremap <Space>gs :Git<CR>
nnoremap <Space>gc :Git commit<CR>
nnoremap <Space>gps :Git push<CR>
nnoremap <Space>gpl :Git pull<CR>
nnoremap <Space>gl :Git log<CR>
nnoremap <Space>gd :Git diff<CR>

" sonictemplate
let g:sonictemplate_vim_template_dir = g:ryoo_plugin_dir . '/plugins/sonictemplate-vim/template'

" fzf
set rtp+=$HOME/.fzf
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': 'ag --hidden --ignore .git -U -g ""'}), <bang>0)
nnoremap <Space>ff :Files<CR>
nnoremap <Space>fb :Buffer<CR>
nnoremap <Space>fgs :GFiles?<CR>
nnoremap <Space>ft :Tags<CR>
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

" rust
let g:rustfmt_autosave = 1

" snippets
" Expand
imap <expr> <C-k> vsnip#expandable() ? '<Plug>(vsnip-expand)':'<C-k>'
smap <expr> <C-k> vsnip#expandable() ? '<Plug>(vsnip-expand)':'<C-k>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)':'<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)':'<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)':'<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)':'<S-Tab>'
let g:vsnip_snippet_dir = expand(g:ryoo_plugin_dir . '/snippets')

" vim-molder
let g:molder_show_hidden = 1
