return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						-- See the config section for more details
						-- Load luvit types when te vim.uv word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					}
				}
			}
		},
		config = function()
			require("lspconfig").lua_ls.setup {}
			require("lspconfig").vtsls.setup {}

			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP Rename" })
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP References" })
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Definition" })
			--vim.keymap.set('n', '<leader>rf', vim.lsp.formatexpr, { desc = "LSP Reformat"})
			--vim.keymap.set('n', '<leader>rf', function() vim.lsp.buf.format() end, { desc = "LSP Format"})
			-- format on save
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end

					if client.supports_method('textDocument/formatting') then
						vim.api.nvim_create_autocmd('BufWritePre', {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
							end,
						})
					end
				end,
			})
		end
	}
}
