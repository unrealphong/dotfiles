local opt = vim.opt
local g = vim.g

opt.number = true
opt.softtabstop = 2
opt.tabstop = 4
opt.shiftwidth = 2
opt.expandtab = true
opt.completeopt = { "menuone", "longest", "noselect" }
opt.clipboard = "unnamedplus"
opt.wildmode = { "longest", "list", "full" }
opt.wildmenu = true
opt.sh = "zsh"
opt.cursorline = true
opt.termguicolors = true
-- opt.guifont = "JetBrainsMono Nerd Font Mono:h24"
opt.showbreak = "↪ "

opt.foldmethod = "indent"
opt.foldnestmax = 10
opt.foldenable = false
opt.autoread = true
opt.showtabline = 2

opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000
opt.ttimeout = true
opt.ttimeoutlen = 0
opt.inccommand = "nosplit"
opt.mouse = "a"

g.mapleader = " "

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
