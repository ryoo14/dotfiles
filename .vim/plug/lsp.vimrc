" General
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_document_highlight_enabled = 0
nnoremap <expr> <C-]> execute('LspDefinition') =~ "not supported" ? "\<C-]>" : ":LspDefinition<cr>"
nnoremap <silent> <Space>ls :rightbelow split \| :LspDefinition <CR>
nnoremap <silent> <Space>lv :rightbelow vsplit \| :LspDefinition <CR>
nnoremap <silent> <Space>lh :LspHover<CR>
nnoremap <silent> <Space>lr :LspReferences<CR>
nnoremap <silent> <Space>li :LspImplementation<CR>
nnoremap <silent> <Space>ln :LspRename<CR>
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server', 'deno']
let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server', 'deno']

let g:lsp_settings = {
\  'typeprof': {'disabled': 1},
\}
