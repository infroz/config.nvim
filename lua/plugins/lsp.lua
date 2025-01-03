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
	    { path = "${3rd}/luv/library", words = { "vim%.uv" }},
	  }
	}
      }
    },
    config = function()
      require("lspconfig").lua_ls.setup {}

      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "LSP Rename"})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP References" })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP Definition" })
      vim.keymap.set('n', '<leader>rf', vim.lsp.formatexpr, { desc = "LSP Reformat"})
    end
  }
}
