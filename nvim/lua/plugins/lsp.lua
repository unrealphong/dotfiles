return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason-lspconfig.nvim',
    'pmizio/typescript-tools.nvim',
    'nvim-lua/plenary.nvim',
    'simrat39/rust-tools.nvim',
  },
  config = function()
    local keymap = vim.keymap
    keymap.set('n', '<leader>m', '<cmd>TSToolsOrganizeImports<cr>')
    keymap.set('n', '<leader>a', '<cmd>TSToolsAddMissingImports<cr>')
    local api = require 'typescript-tools.api'

    require('mason-lspconfig').setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup()
      end,
      lua_ls = function()
        require('lspconfig').lua_ls.setup(vim.tbl_extend('force', {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        }))
      end,
      tsserver = function()
        require('typescript-tools').setup {
          handlers = {
            ['textDocument/publishDiagnostics'] = api.filter_diagnostics { 6133 },
          },
          settings = {
            tsserver_file_preferences = {
              importModuleSpecifierPreference = 'non-relative',
              importModuleSpecifierEnding = 'auto',
            },
            tsserver_format_options = {
              allowIncompleteCompletions = true,
              allowRenameOfImportPath = true,
            },
          },
        }
      end,
      solargraph = function()
        require('lspconfig').solargraph.setup(vim.tbl_extend('force', {
          cmd = { 'solargraph', 'stdio' },
          filetypes = { 'ruby' },
          init_options = {
            formatting = true,
          },
          root_dir = require('lspconfig.util').root_pattern('Gemfile', '.git'),

          settings = {
            solargraph = {
              diagnostics = true,
              completion = true,
            },
          },
        }))
      end,
      rust_analyzer = function()
        require('rust-tools').setup {
          server = {
            cmd = {
              'rustup',
              'run',
              'stable',
              'rust_analyzer',
            },
            standalone = true,
          },
        }
      end,
      clangd = function()
        require('lspconfig').clangd.setup(vim.tbl_extend('force', {
          cmd = {
            'clangd',
            '--background-index',
            '--suggest-missing-includes',
            '--clang-tidy',
            '--header-insertion=iwyu',
          },
          filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
          root_dir = require('lspconfig.util').root_pattern(
            '.clangd',
            'compile_commands.json',
            'compile_flags.txt',
            '.git'
          ),
          settings = {
            clangd = {},
          },
          init_options = {
            clangdFileStatus = true,
            cache = {
              directory = '.cache/clangd',
            },
            highlight = {
              lsRanges = true,
            },
            index = {
              background = true,
              onChange = true,
              onPackageFileChanged = true,
            },
            client = {
              snippetSupport = true,
            },
          },
        }))
      end,
      gopls = function()
        require('lspconfig').gopls.setup(vim.tbl_extend('force', {
          cmd = { 'gopls', 'serve' },
          filetypes = { 'go', 'gomod', 'gowork' },
          root_dir = require('lspconfig.util').root_pattern(
            'go.mod',
            'go.work',
            '.git'
          ),
          settings = {
            gopls = {
              experimentalPostfixCompletions = true,
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        }))
      end,
      phpactor = function()
        require('lspconfig').phpactor.setup(vim.tbl_extend('force', {
          cmd = { 'phpactor', 'language-server' },
          init_options = {
            ['language_server_phpstan.enabled'] = false,
            ['language_server_psalm.enabled'] = false,
          },
        }))
      end,
    }
  end,
}
