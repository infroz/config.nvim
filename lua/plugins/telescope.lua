return { {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
	},
	config = function()
		local builtin = require('telescope.builtin')


		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

		-- git stuff
		vim.keymap.set('n', '<leader>gfb', builtin.git_branches, { desc = "Find git branch" })

		-- in buffer fuzzy search
		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set('n', '<leader>/', function()
			local builtin = require('telescope.builtin')
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = '[/] Fuzzily search in current buffer' })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set('n', '<leader>fn', function()
			local builtin = require('telescope.builtin')
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = '[F]ind [N]eovim files' })
	end,

} }
