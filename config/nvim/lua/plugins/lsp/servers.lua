return {
  ts_ls = {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = "/Users/lehongphong/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
          languages = { "vue" },
        },
      },
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  },
  tailwindcss = {},
  lua_ls = {},
  jdtls = {},
  pyright = {
    cmd = { "pyright-langserver", "--studio" },
    single_file_suport = true,
    filetypes = { "python" },
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  solargraph = {},
  ruby_lsp = {},
}
