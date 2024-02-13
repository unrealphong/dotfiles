return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
      },
    }
    require('lspconfig').lua_ls.setup {
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if
            not vim.loop.fs_stat(path .. '/.luarc.json')
            and not vim.loop.fs_stat(path .. '/.luarc.jsonc')
        then
          client.config.settings =
              vim.tbl_deep_extend('force', client.config.settings, {
                Lua = {
                  runtime = {
                    version = 'LuaJIT',
                  },
                  diagnostics = {
                    globals = { 'vim' },
                  },
                  -- Make the server aware of Neovim runtime files
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      vim.env.VIMRUNTIME,
                    },
                  },
                },
              })

          client.notify(
            'workspace/didChangeConfiguration',
            { settings = client.config.settings }
          )
        end
        return true
      end,
      require('lspconfig').tsserver.setup {},
      capabilities = capabilities,
      on_attach = on_lsp_attach,
    }
  end,
}
