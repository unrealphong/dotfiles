return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        svelte = { { 'prettier' } },
        vue = { 'prettier' },
        astro = { 'prettier' },
        php = { 'php_cs_fixer' },
      },
      format_on_save = {
        pattern = '.lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs',
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
      },
    }
  end,
}
