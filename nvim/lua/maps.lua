vim.g.mapleader = " "
local keymap = vim.keymap
vim.keymap.set("n", "<leader>m", "<cmd>TSToolsOrganizeImports<cr>")
vim.keymap.set("n", "<leader>a", "<cmd>TSToolsAddMissingImports<cr>")

keymap.set("n", "<leader>q", "<cmd>q<cr>")
keymap.set("n", "<leader>w", "<cmd>w<cr>")
keymap.set("n", "<leader>x", "<cmd>x<cr>")

keymap.set("n", "<c-a>", "ggVG")

keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

keymap.set("n", "j", [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set("n", "k", [[v:count?'k':'gk']], { noremap = true, expr = true })

keymap.set({ "n", "x" }, "<leader>p", '"0p')
