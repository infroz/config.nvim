require("config.lazy")

vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Setting my default tabbing - neovim always respects .editorconfig over this
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = false
vim.opt.clipboard = 'unnamedplus' -- paste and yank uses system clipboard

-- buffer management
vim.keymap.set('n', '<leader>bo', '<cmd>%bd!|e#<CR>', { desc = 'Delete other buffers' })
vim.keymap.set('n', '<leader>bd', '<cmd>bd!<CR>', { desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd!<CR>', { desc = 'Delete * buffers' })


-- Window management - default wincmd's are <Ctrl-w>hjkl
vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>', { desc = 'Nav win left' })
vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>', { desc = 'Nav win down' })
vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>', { desc = 'Nav win up' })
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>', { desc = 'Nav win right' })

-- Highlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (Copying text)',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
