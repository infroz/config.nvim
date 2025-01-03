require("config.lazy")

vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.opt.shiftwidth = 2
vim.opt.clipboard = 'unnamedplus' -- paste and yank uses system clipboard

-- Highlight yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (Copying text)',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
