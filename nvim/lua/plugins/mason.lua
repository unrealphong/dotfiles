return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }
    -- require('mason-lspconfig').setup {}
    require('mason-tool-installer').setup {
      ensure_installed = {
        'prettierd',
        'tailwindcss-language-server',
        'gopls',
        'mdx-analyzer',
        'jdtls',
        'pyright',
        'clangd',
        'graphql-language-service-cli',
        'json-lsp',
        'lua-language-server',
        'rust-analyzer',
        'solargraph',
        'stylua',
        'typescript-language-server',
        'ember-language-server',
        'vue-language-server',
        'astro-language-server',
        'svelte-language-server',
      },
      auto_update = true,
    }
  end,
}
