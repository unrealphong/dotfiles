return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
    },
    config = function()
      require('nvim-treesitter.configs').setup {
      }
    end,
  },
}
