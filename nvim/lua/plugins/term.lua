return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require('toggleterm').setup {
				open_mapping = [[<c-\>]],
				derection = 'float',
				float_opts = {
					border = 'curved',
					width = 120,
					height = 30,
	}
			}
		end
	}
}
