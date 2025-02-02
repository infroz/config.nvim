-- CSharp
local csharp = require 'csharp'

-- Listen to LSP Attach
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = args.buf,
			callback = function()
				-- Format the code before you run fix usings
				vim.lsp.buf.format({ timeout = 1000, async = false })

				require("csharp").fix_usings()
			end,
		})
	end
})

-- .NET development keymaps

-- Project Management
vim.keymap('n', '<leader>pd', function() csharp.debug_project() end, { desc = 'Debug project' })
