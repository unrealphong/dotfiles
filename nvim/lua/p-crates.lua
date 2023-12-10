local crates = require 'crates'
local opts = { silent = true }

-- for crates.nvim
local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ 'vim', 'help' }, filetype) then
    vim.cmd('h ' .. vim.fn.expand '<cword>')
  elseif vim.tbl_contains({ 'man' }, filetype) then
    vim.cmd('Man ' .. vim.fn.expand '<cword>')
  elseif
    vim.fn.expand '%:t' == 'Cargo.toml' and require('crates').popup_available()
  then
    require('crates').show_popup()
  else
    vim.cmd 'Lspsaga hover_doc'
  end
end

vim.keymap.set('n', '<space>k', show_documentation, { silent = true })

vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)
