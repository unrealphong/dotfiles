return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'axelvc/template-string.nvim',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'typescript',
          'javascript',
          'html',
          'css',
          'scss',
          'dockerfile',
          'tsx',
          'lua',
          'rust',
          'json',
          'markdown',
          'markdown_inline',
          'go',
          'yaml',
        },

        sync_install = false,

        auto_install = true,

        highlight = {
          enable = true,
          use_languagetree = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        refactor = {
          highlight_definitions = {
            enable = true,
          },
          highlight_current_scope = {
            enable = false,
          },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<enter>',
            node_incremental = '<enter>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
      }

      require('template-string').setup {}

      -- fold
      local opt = vim.opt
      opt.foldmethod = 'expr'
      opt.foldexpr = 'nvim_treesitter#foldexpr()'
      opt.foldenable = false
    end,
  },
}
