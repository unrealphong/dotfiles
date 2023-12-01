require("mason").setup {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}
require("mason-tool-installer").setup {
  ensure_installed = {
    "prettierd",
    "tailwindcss-language-server",
    "gopls",
    "mdx-analyzer",
    "jdtls",
    "pyright",
    "clangd",
    "graphql-language-service-cli",
    "json-lsp",
    "lua-language-server",
    "rust-analyzer",
    "solargraph",
    "stylua",
    "typescript-language-server",
    "ember-language-server",
    "vue-language-server",
    "angular-language-server",
    "astro-language-server",
    "svelte-language-server",
  },
  auto_update = true,
}
