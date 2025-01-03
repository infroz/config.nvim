require("config.lazy")

vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = false
vim.opt.clipboard = 'unnamedplus' -- paste and yank uses system clipboard

-- buffer management
vim.keymap.set('n', '<leader>bo', '<cmd>%bd|e#!<CR>', { desc = 'Delete other buffers' })
vim.keymap.set('n', '<leader>bd', '<cmd>bd!<CR>', { desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>ba', '<cmd>1,$bd!<CR>', { desc = 'Delete * buffers' })

-- Highlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (Copying text)',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
