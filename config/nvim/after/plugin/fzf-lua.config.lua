require('fzf-lua').setup({
  winopts = {
    preview = {
      hidden = 'hidden',
    },
  },
})

vim.api.nvim_create_user_command(
  'FzfWh',
  function(opts)
    local fzf_lua = require('fzf-lua')
    opts = opts or {}
    opts.prompt = "WH LIST> "
    opts.fn_transform = function(x)
      return fzf_lua.utils.ansi_codes.magenta(x)
    end
    opts.actions = {
      ['default'] = function(selected)
        vim.cmd("cd " .. selected[1])
      end
    }
    fzf_lua.fzf_exec('wh list --full-path', opts)
  end,
  {}
)
