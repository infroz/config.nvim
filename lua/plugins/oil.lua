return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      local oil = require('oil')

      oil.setup()
      
      vim.keymap.set("n","<leader>ed",":O<Cr>", { desc = "Explore current dir" })
      vim.keymap.set("n","<leader>ee",":O" .. vim.fn.getcwd() .. "<Cr>", { desc = "Explore cwd" })
    end
  }
}
