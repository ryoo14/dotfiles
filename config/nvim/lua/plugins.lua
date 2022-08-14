local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use({ 'wbthomason/packer.nvim', opt = true })

  -- UI
  use({ 'sainnhe/everforest' })
  use({ 'nvim-lualine/lualine.nvim' }) -- Statusline
  use({ 'lukas-reineke/indent-blankline.nvim' })
  use({ 'xiyaowong/nvim-transparent' })

  -- LSP, Completion
  use({ 'williamboman/mason.nvim' })
  use({ 'williamboman/mason-lspconfig.nvim' })
  use({ 'neovim/nvim-lspconfig' })
  use({ 'hrsh7th/cmp-buffer' })
  use({ 'hrsh7th/cmp-nvim-lsp' })
  use({ 'hrsh7th/nvim-cmp' })
  use({ 'jose-elias-alvarez/null-ls.nvim' })
  use({ 'L3MON4D3/LuaSnip' })

  -- Etc
  use({ 'nvim-lua/plenary.nvim' })     -- Common utilities
  use({ 'MunifTanjim/prettier.nvim' }) -- Prettier plugin for Neovim's built-in LSP client
  use({ 'tamago324/lir.nvim' })        -- Filer
  use({ 'ibhagwan/fzf-lua' })          -- fzf
  use({ 'lewis6991/gitsigns.nvim' })
  use({ 'dinhhuy258/git.nvim' })
end)
