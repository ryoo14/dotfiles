vim.cmd('autocmd!')

vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ruler = false
vim.opt.laststatus = 2
vim.opt.showtabline = 1
vim.opt.cmdheight = 1
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.showmatch = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = '/tmp'
vim.opt.keywordprg = ':help'
vim.opt.helplang = { 'ja', 'en' }
vim.opt.belloff = 'all'
vim.opt.shell = 'bash'
vim.opt.splitright = true
vim.opt.termguicolors = true

local fileTypeSet = vim.api.nvim_create_augroup('FileTypeSet', {})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'vim', 'ruby', 'html', 'yaml', 'json', 'sh', 'markdown' },
  command = 'setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab',
  group = fileTypeSet
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  command = 'setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab',
  group = fileTypeSet
})

vim.cmd [[colorscheme everforest]]

local function on_cursor_hold()
  if vim.lsp.buf.server_ready() then
    vim.diagnostic.open_float()
  end
end

local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
vim.api.nvim_set_option('updatetime', 500)
vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, { group = diagnostic_hover_augroup_name, callback = on_cursor_hold })

vim.diagnostic.config({
  virtual_text = false,
})
