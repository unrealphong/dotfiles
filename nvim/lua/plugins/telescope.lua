return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require 'telescope.builtin'
		local keymap = vim.keymap
		keymap.set('n', '<leader>f', builtin.find_files, {})
		keymap.set('n', '<leader>g', builtin.live_grep, {})

		local actions = require 'telescope.actions'
		require('telescope').setup {
			defaults = {
				mappings = {
					i = {
						['esc'] = actions.close,
					} }
			}
		}
	end
}
