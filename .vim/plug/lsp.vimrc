" General
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1
nnoremap <silent> <C-]> :LspDefinition<CR>
nnoremap <silent> <Space>ls :rightbelow split \| :LspDefinition <CR>
nnoremap <silent> <Space>lv :rightbelow vsplit \| :LspDefinition <CR>
nnoremap <silent> <Space>lh :LspHover<CR>
nnoremap <silent> <Space>lr :LspReferences<CR>
nnoremap <silent> <Space>li :LspImplementation<CR>
nnoremap <silent> <Space>ln :LspRename<CR>


" Ruby
if executable('solargraph')
  augroup LspRuby
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'solargraph',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
      \ 'initialization_options': {"diagnostics": "true"},
      \ 'whitelist': ['ruby'],
      \ })
    autocmd FileType ruby setlocal omnifunc=lsp#complete
  augroup END
endif

" HTML
if executable('html-languageserver')
  augroup LspHTML
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'html-languageserver',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
      \ 'whitelist': ['html'],
      \ })
    autocmd FileType html setlocal omnifunc=lsp#complete
  augroup END
endif

" Docker
if executable('docker-langserver')
  augroup LspDocker
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'docker-langserver',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
      \ 'whitelist': ['dockerfile'],
      \ })
    autocmd FileType dockerfile setlocal omnifunc=lsp#complete
  augroup END
endif

" Rust
if executable('rls')
  augroup LspRust
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'rls',
      \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
      \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
      \ 'whitelist': ['rust'],
      \ })
    autocmd FileType rust setlocal omnifunc=lsp#complete
  augroup END
endif
