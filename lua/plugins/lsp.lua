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

			require("lspconfig").omnisharp.setup({
				cmd = { "dotnet" },
				-- Enables support for reading code style, naming convention and analyzer
				-- settings from .editorconfig.
				enable_editorconfig_support = true,
				-- If true, MSBuild project system will only load projects for files that
				-- were opened in the editor. This setting is useful for big C# codebases
				-- and allows for faster initialization of code navigation features only
				-- for projects that are relevant to code that is being edited. With this
				-- setting enabled OmniSharp may load fewer projects and may thus display
				-- incomplete reference lists for symbols.
				enable_ms_build_load_projects_on_demand = false,
				-- Enables support for roslyn analyzers, code fixes and rulesets.
				enable_roslyn_analyzers = false,
				-- Specifies whether 'using' directives should be grouped and sorted during
				-- document formatting.
				organize_imports_on_format = true,
				-- Enables support for showing unimported types and unimported extension
				-- methods in completion lists. When committed, the appropriate using
				-- directive will be added at the top of the current file. This option can
				-- have a negative impact on initial completion responsiveness,
				-- particularly for the first few completion sessions after opening a
				-- solution.
				enable_import_completion = true,
				-- Specifies whether to include preview versions of the .NET SDK when
				-- determining which version to use for project loading.
				sdk_include_prereleases = true,
				-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
				-- true
				analyze_open_documents_only = false,
			})

			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP Rename" })
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Actions" })

			-- Moved to plugins/telescope.lua
			--vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP References" })
			-- Moved to plugins/telescope.lua
			--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Definition" })

			-- format on save
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end

					if client:supports_method('textDocument/formatting') then
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
