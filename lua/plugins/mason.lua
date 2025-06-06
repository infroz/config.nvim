return {
	{
		"williamboman/mason.nvim",
		config = function()
			require('mason').setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local lspconfig = require('lspconfig')
			local mason_lspconfig = require('mason-lspconfig')

			-- # Default installs
			mason_lspconfig.setup({
				ensure_installed = {
					-- # Web Dev
					"vtsls",
					"html",
					"cssls",

					-- # mostly for vim config
					"lua_ls",

					-- # C#
					"omnisharp",

				},
				-- replacement for setup_handlers
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({})
					end,
				},
			})

			-- throws error on init...
			-- mason_lspconfig.setup_handlers({
			-- 	function(server_name)
			-- 		lspconfig[server_name].setup {}
			-- 	end
			-- })
		end
	},
}
