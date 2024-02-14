return {
  "pmizio/typescript-tools.nvim",
  event = "BufReadPre",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  config = function()
    local keymap = vim.keymap
    local api = require("typescript-tools.api")
    keymap.set("n", "<leader>m", "<cmd>TSToolsOrganizeImports<cr>")
    keymap.set("n", "<leader>a", "<cmd>TSToolsAddMissingImports<cr>")
    require("typescript-tools").setup({
      handlers = {
        ["textDocument/publishDiagnostics"] = api.filter_diagnostics(
          -- Ignore 'This may be converted to an async function' diagnostics.
          { 80006 }
        ),
      },
      settings = {
        -- separate_diagnostic_server = true,
        expose_as_code_action = "all",
        tsserver_max_memory = "auto",
        complete_function_calls = true,
        include_completions_with_insert_text = true,
        tsserver_file_preferences = {
          importModuleSpecifierPreference = "non-relative",
          importModuleSpecifierEnding = "auto",
          includeInlayParameterNameHints = "all", -- "none" | "literals" | "all";
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
          includeCompletionsForModuleExports = true,
          quotePreference = "auto",
        },
        tsserver_format_options = {
          allowIncompleteCompletions = true,
          allowRenameOfImportPath = true,
        },
      },
    })
  end,
}
