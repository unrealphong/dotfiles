local opt = vim.opt
opt.signcolumn = 'yes'
opt.number = true
opt.relativenumber = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

opt.mouse:append 'a'
opt.clipboard:append 'unnamedplus'

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.cursorline = true
opt.termguicolors = true
  opt.guifont = "JetBrainsMono Nerd Font Mono:h24"
  opt.showbreak = "↪ "
  opt.listchars = {
    tab = "→ ",
    eol = "↲",
    nbsp = "␣",
    trail = "•",
    extends = "⟩",
    precedes = "⟨"
  }
    opt.undofile = true
  opt.undodir = vim.fn.expand("$HOME/.tmp/nvim/undo", nil, nil)
vim.g.loaded_perl_provider = 0

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 300,
    }
  end,
})
