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
					"vtsls",
					"lua_ls",
					"html",
					"cssls",
					--					"csharp_ls",
					--					"netcoredbg", -- DAP for cg
				}
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup {}
				end
			})
		end
	},
}
