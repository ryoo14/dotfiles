" General
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
nnoremap <silent> <C-]> :LspDefinition<CR>
nnoremap <silent> <Space>ls :rightbelow split \| :LspDefinition <CR>
nnoremap <silent> <Space>lv :rightbelow vsplit \| :LspDefinition <CR>
nnoremap <silent> <Space>lh :LspHover<CR>
nnoremap <silent> <Space>lr :LspReferences<CR>
nnoremap <silent> <Space>li :LspImplementation<CR>
nnoremap <silent> <Space>ln :LspRename<CR>
