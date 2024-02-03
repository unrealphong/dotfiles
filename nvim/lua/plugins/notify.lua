return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      stages = 'fade_in_slide_out',
      render = 'compact',
      -- Default timeout for notifications
      timeout = 1500,
      background_colour = '#000000',
    }
  end,
}
