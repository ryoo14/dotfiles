local actions = require('lir.actions')

require('lir').setup {
  show_hidden_files = true,
  devicons_enable = false,
  mappings = {
    ['<CR>']  = actions.edit,
    ['-']     = actions.up,
    ['<ESC>'] = actions.quit,
    ['@']     = actions.cd,
  },
  hide_cursor = true,
}
