require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "org",
    "typescript",
    "javascript",
    "html",
    "css",
    "tsx",
    "lua",
    "rust",
    "json",
    "graphql",
    "regex",
    "prisma",
    "markdown",
    "markdown_inline",
    "go",
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = { "org", "false" },
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      markdown = "mdx",
    },
  },
  rainbow = {
    enable = false,
    extended_mode = true,
    max_file_lines = nil,
  },
}

require("ts_context_commentstring").setup {
  enable_autocmd = true,
}

require("template-string").setup {
  filetypes = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact",
    "python",
  },
  jsx_brackets = true,
  remove_template_string = false,
  restore_quotes = {
    normal = [[']],
    jsx = [["]],
  },
}

require("treesitter-context").setup {
  enable = true,
  max_lines = 0,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = "outer",
  mode = "cursor",
  separator = nil,
  zindex = 20,
  on_attach = nil,
}
