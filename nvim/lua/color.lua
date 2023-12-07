-- vim.g.everforest_diagnostic_line_highlight = 1
-- vim.g.everforest_transparent_background = 1
-- vim.g.everforest_background = 'hard'
-- vim.g.everforest_enable_italic = 1
-- vim.g.everforest_disable_italic_comment = 1
-- vim.g.everforest_diagnostic_text_highlight = 1
-- vim.g.everforest_diagnostic_virtual_text = 'colored'
--
 vim.cmd('colorscheme everforest')

vim.fn.sign_define {
  {
    name = "DiagnosticSignError",
    text = "",
    texthl = "DiagnosticSignError",
    linehl = "ErrorLine",
  },
  {
    name = "DiagnosticSignWarn",
    text = "",
    texthl = "DiagnosticSignWarn",
    linehl = "WarningLine",
  },
  {
    name = "DiagnosticSignInfo",
    text = "",
    texthl = "DiagnosticSignInfo",
    linehl = "InfoLine",
  },
  {
    name = "DiagnosticSignHint",
    text = "",
    texthl = "DiagnosticSignHint",
    linehl = "HintLine",
  },
}
