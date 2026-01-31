return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- This ensures these are downloaded automatically
      ensure_installed = { "lua_ls", "gopls", "clangd" },
      automatic_installation = true,
    },
  },
}
