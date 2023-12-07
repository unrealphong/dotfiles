local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print "err"
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  "sainnhe/everforest",

  "nvim-lualine/lualine.nvim",

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  "NvChad/nvim-colorizer.lua",

  "MattesGroeger/vim-bookmarks",
  "tom-anders/telescope-vim-bookmarks.nvim",

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  "simrat39/rust-tools.nvim",
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        src = {
          cmp = {
            enabled = true,
          },
        },
        null_ls = {
          enabled = true,
        },
        popup = {
          autofocus = true,
          hide_on_select = true,
        },
      }
    end,
  },

  "rmagatti/alternate-toggler",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  "mg979/vim-visual-multi",
  "gcmt/wildfire.vim",

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  "nvim-telescope/telescope.nvim",
  "axelvc/template-string.nvim",
  "nvim-lua/plenary.nvim",
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "onsails/lspkind-nvim",
  "glepnir/lspsaga.nvim",

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },
  { "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } },
  "fedepujol/move.nvim",
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  -- "jose-elias-alvarez/typescript.nvim",
  "jose-elias-alvarez/null-ls.nvim",

  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  "nvim-treesitter/nvim-treesitter",

  "nvim-treesitter/nvim-treesitter-context",
  "windwp/nvim-ts-autotag",

  "folke/todo-comments.nvim",
  "numToStr/Comment.nvim",
  "akinsho/toggleterm.nvim",

  "f-person/git-blame.nvim",
  -- "github/copilot.vim",

  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  {
    "mrjones2014/legendary.nvim",
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    -- sqlite is only needed if you want to use frecency sorting
    -- dependencies = { 'kkharji/sqlite.lua' }
  },

  "hinell/duplicate.nvim",

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}

require "base"
require "color"
require "text"
require "other"
require "neovide"

require "p-mason"
require "p-lsp"
-- require "typescript"
require "maps"
require "p-lspsaga"
require "p-lualine"
-- require "p-galaxyline"
require "p-lint"
require "p-telescope"
require "p-lspkind"
require "p-cmp"
require "p-snip"
require "p-treesitter"
require "p-tree"
require "p-comment"
require "p-indent"
require "p-colorizer"
require "p-conform"
require "p-null"
require "p-crates"
