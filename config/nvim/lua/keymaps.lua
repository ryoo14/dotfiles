vim.keymap.set('n', '<Space>ev', ':edit $MYVIMRC', { noremap = true })
vim.keymap.set('n', '<Space>rv', ':source $MYVIMRC', { noremap = true })
vim.keymap.set('', 'j', 'gj', { noremap = true })
vim.keymap.set('', 'k', 'gk', { noremap = true })
vim.keymap.set('n', 'ZZ', '<nop>', { noremap = true })
vim.keymap.set('n', '<C-z>', '<nop>', { noremap = true })
vim.keymap.set('n', '*', '*N', { noremap = true })
vim.keymap.set('n', '<Space>fi', ':edit .<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'x', '"_x', { noremap = true })
vim.keymap.set('i', '<C-l>', '<C-g>U<Right>', { noremap = true })
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true })
vim.keymap.set('c', '<C-d>', '<Del>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true })
vim.keymap.set('c', '<C-n>', '<Down>', { noremap = true })
vim.keymap.set('c', '<C-p>', '<Up>', { noremap = true })
vim.keymap.set('c', '<C-y>', '<C-r>*', { noremap = true })
-- vim.keymap.set('n', '<Space>tt', ':tab terminal<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>tt', ':TransparentToggle<CR>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>lh',  '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>lr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>fb', ':FzfLua buffers<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>ff', ':FzfLua files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>fq', ':FzfWh<CR>', { noremap = true, silent = true })
