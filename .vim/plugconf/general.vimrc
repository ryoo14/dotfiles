" vim-json
let g:vim_json_syntax_conceal = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" lightline
let g:lightline = {'colorscheme' : 'jellybeans'}

" indentline
let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" previm
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
nnoremap <Space>md :PrevimOpen

" quickrun
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
nnoremap <Space>qr :QuickRun

" fugitive
nnoremap <Space>gl :Glog<CR>
nnoremap <Space>gd :Gdiff<CR>

" sonictemplate
let g:sonictemplate_vim_template_dir = '~/.vim/plugged/sonictemplate-vim/template'

" fzf
set rtp+=$HOME/.fzf
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': 'ag --hidden --ignore .git -g ""'}), <bang>0)
nnoremap <Space>ff :Files<CR>
nnoremap <Space>fb :Buffer<CR>
nnoremap <Space>fgs :GFiles?<CR>
nnoremap <Space>ft :Tags<CR>
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'

" rust
let g:rustfmt_autosave = 1

" snippets
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim-molder
let g:molder_show_hidden = 1
