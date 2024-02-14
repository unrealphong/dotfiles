return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'axelvc/template-string.nvim',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground'
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          "tsx", "rust", "typescript", "javascript", "go","lua"
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25,
          persist_queries = false
        },
        highlight = {
          disable = { "sql" },
          enable = true, -- false will disable the whole extension
        },
        refactor = {
          highlight_definitions = { enable = true },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "gnn",
            scope_incremental = "grc",
            node_decremental = "gnp",
          },
        },
        textobjects = {
          select = {
            enable = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>ts"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>tS"] = "@parameter.inner",
            },
          }
        }
      }
      require('template-string').setup {}
    end,
  },
}
