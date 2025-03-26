return {
  ts_ls = {},
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
