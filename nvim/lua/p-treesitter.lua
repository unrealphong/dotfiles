require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'org',
    'typescript',
    'javascript',
    'html',
    'css',
    'tsx',
    'lua',
    'rust',
    'json',
    'graphql',
    'regex',
    'prisma',
    'markdown',
    'markdown_inline',
    'go',
  },
  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-space>',
      node_incremental = '<C-space>',
      scope_incremental = false,
      node_decremental = '<bs>',
    },
  },
}
require('treesitter-context').setup {
  enable = true,
  max_lines = 0,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = 'outer',
  mode = 'cursor',
  separator = nil,
  zindex = 20,
  on_attach = nil,
}

require('template-string').setup()

-- fold
local opt = vim.opt
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
