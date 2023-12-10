require('alternate-toggler').setup {
  alternates = {
    ['==='] = '!==',
    ['=='] = '!=',
    ['error'] = 'warn',
  },
}

require('nvim-surround').setup {}

local tsj = require 'treesj'

tsj.setup {
  use_default_keymaps = false,
}
