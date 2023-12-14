local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  print 'err'
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require 'base'
-- require 'other'
require 'neovide'
-- require 'text'
require 'maps'
require('lazy').setup 'plugins'

-- require 'p-lspsaga'
-- require 'p-lint'
-- require 'p-telescope'
-- require 'p-lspkind'
-- require 'p-cmp'
-- require 'p-snip'
-- require 'p-treesitter'
-- require 'p-tree'
-- require 'p-comment'
-- require 'p-indent'
-- require 'p-colorizer'
-- require 'p-crates'
