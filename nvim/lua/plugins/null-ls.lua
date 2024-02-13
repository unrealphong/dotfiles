return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'
    require('null-ls').setup {
      null_ls = {
        enabled = true,
      },
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.eslint.with {
          extra_args = {
            '--no-semi',
            '--single-quote',
            '--trailing-comma=all',
            '--single-attribute-per-line',
          },
        },
      },
    }
  end,
}
