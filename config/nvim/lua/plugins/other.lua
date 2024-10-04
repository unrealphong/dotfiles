return {
  {
    "rmagatti/alternate-toggler",
    config = function()
      require("alternate-toggler").setup({
        alternates = {
          ["==="] = "!==",
          ["=="] = "!=",
          ["error"] = "warn",
        },
      })

      local keymap = vim.keymap

      keymap.set("n", "<leader>i", "<cmd>ToggleAlternate<cr>")
    end,
  },
  -- Autotags
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = false,
          },
          ["tsx"] = {
            enable_close = true,
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  -- delete buffer
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
    config = function()
      vim.keymap.set(
        "n",
        "Q",
        ":lua require('bufdelete').bufdelete(0, false)<cr>",
        { noremap = true, silent = true, desc = "Delete buffer" }
      )
    end,
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

  -- Neovim plugin to improve the default vim.ui interfaces
  {
    "stevearc/dressing.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    config = function()
      require("dressing").setup()
    end,
  },

  -- Neovim notifications and LSP progress messages
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    enabled = false,
    config = function()
      require("fidget").setup({
        window = { blend = 0 },
      })
    end,
  },

  -- Smooth scrolling neovim plugin written in lua
  {
    "karb94/neoscroll.nvim",
    -- enabled = false,
    config = function()
      require("neoscroll").setup({
        stop_eof = true,
        easing_function = "sine",
        hide_cursor = true,
        cursor_scrolls_alone = true,
      })
    end,
  },

  -- find and replace
  {
    "windwp/nvim-spectre",
    enabled = false,
    event = "BufRead",
    keys = {
      {
        "<leader>Rr",
        function()
          require("spectre").open()
        end,
        desc = "Replace",
      },
      {
        "<leader>Rw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Replace Word",
      },
      {
        "<leader>Rf",
        function()
          require("spectre").open_file_search()
        end,
        desc = "Replace Buffer",
      },
    },
  },

  -- Add/change/delete surrounding delimiter pairs with ease
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Heuristically set buffer options
  {
    "tpope/vim-sleuth",
  },

  {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    { -- optional completion source for require statements and module annotations
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
    },
  },

  -- Lorem Ipsum generator for Neovim
  {
    "derektata/lorem.nvim",
    enabled = false,
    config = function()
      local lorem = require("lorem")
      lorem.setup({
        sentenceLength = "mixedShort",
        comma = 1,
      })
    end,
  },

  -- Indent guide for Neovim
  -- editor config support
  {
    "editorconfig/editorconfig-vim",
  },

  -- Enhanced f/t motions for Leap
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs({ "f", "F", "t", "T" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  -- mouse replacement
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  -- persist sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
  },

  -- better code annotation
  {
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local neogen = require("neogen")

      neogen.setup({
        snippet_engine = "luasnip",
      })
    end,
    keys = {
      {
        "<leader>ng",
        function()
          require("neogen").generate()
        end,
        desc = "Generate code annotations",
      },
      {
        "<leader>nf",
        function()
          require("neogen").generate({ type = "func" })
        end,
        desc = "Generate Function Annotation",
      },
      {
        "<leader>nt",
        function()
          require("neogen").generate({ type = "type" })
        end,
        desc = "Generate Type Annotation",
      },
    },
  },
  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        -- needed since it will be false when loading and mini will fail
        package.loaded["nvim-web-devicons"] = {}
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  {
    "fladson/vim-kitty",
  },
}
