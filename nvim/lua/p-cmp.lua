local cmp = require "cmp"
local luasnip = require "luasnip"
local lspkind = require "lspkind"
local llm = require "llm"

llm.setup {
  api_token = nil, -- cf Install paragraph
  model = "bigcode/starcoder", -- can be a model ID or an http(s) endpoint
  tokens_to_clear = { "<|endoftext|>" }, -- tokens to remove from the model's output
  -- parameters that are added to the request body
  query_params = {
    max_new_tokens = 60,
    temperature = 0.2,
    top_p = 0.95,
    stop_tokens = nil,
  },
  -- set this if the model supports fill in the middle
  fim = {
    enabled = true,
    prefix = "<fim_prefix>",
    middle = "<fim_middle>",
    suffix = "<fim_suffix>",
  },
  debounce_ms = 150,
  accept_keymap = "<Tab>",
  dismiss_keymap = "<S-Tab>",
  tls_skip_verify_insecure = false,
  -- llm-ls configuration, cf llm-ls section
  lsp = {
    bin_path = nil,
    version = "0.4.0",
  },
  tokenizer = nil, -- cf Tokenizer paragraph
  context_window = 8192, -- max number of tokens for the context window
  enable_suggestions_on_startup = true,
  enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
}

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-c>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<c-d>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<c-b>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    {
      name = "nvim_lsp",
      entry_filter = function(entry)
        return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
      end,
    },
    { name = "luasnip" },
    { name = "orgmode" },
    { name = "crates" },
  }, {
    { name = "buffer" },
  }),
  formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({ "path" }, entry.source.name) then
        local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = icon
          vim_item.kind_hl_group = hl_group
          return vim_item
        end
      end
      return lspkind.cmp_format { with_text = true }(entry, vim_item)
    end,
  },
}

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" },
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

vim.cmd [[
set completeopt=menuone,noinsert,noselect
highlight! default link CmpItemKind CmpItemMenuDefault
]]
