return {
  'saecki/crates.nvim',
  event = { 'BufRead Cargo.toml' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('crates').setup {
      src = {
        cmp = {
          enabled = true,
        },
      },
      null_ls = {
        enabled = true,
        name = 'crates.nvim',
      },
      popup = {
        autofocus = true,
        hide_on_select = true,
      },
      lsp = {
        enabled = true,
        on_attach = function(client, bufnr)
          -- the same on_attach function as for your other lsp's
        end,
        actions = true,
        completion = true,
      },
    }
    local crates = require 'crates'
    local opts = { silent = true }

    vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
    vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
    vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)
  end,
}
