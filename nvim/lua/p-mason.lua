require("mason").setup()

require('mason-tool-installer').setup {
  ensure_installed = {
    'tailwindcss-language-server',
    'gopls',
    'mdx-analyzer',
    'jdtls',
    'pyright',
    'clangd',
    'eslint-lsp',
    'graphql-language-service-cli',
    'json-lsp',
    'lua-language-server',
    'prettierd',
    'rust-analyzer',
    'solargraph',
    'stylua',
    'typescript-language-server',
    'vue-language-server'
  },
  auto_update = true,
}
