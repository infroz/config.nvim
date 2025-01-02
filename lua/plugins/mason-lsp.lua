return {
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").lua_ls.setup {}
      require("lspconfig.configs").vtsls = require("vtsls").lspconfig 
      require("lspconfig").vtsls = require("vtsls").setup {}

      require("mason").setup()
      require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "vtsls", "eslint"},
      
      })

      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function ()
            require("rust-tools").setup {}
        end
    }
  end
  }, { "williamboman/mason.nvim", config = function() require("mason").setup {} end }
}

