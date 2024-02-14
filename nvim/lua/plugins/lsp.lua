return {
	'neovim/nvim-lspconfig',
	config = function()
		local lspconfig = require('lspconfig')
		-- lua-ls
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					diagnostics = { globals = { 'vim' } } }
			}
		}
        lspconfig.tsserver.setup{}
	end
}
