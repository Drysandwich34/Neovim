return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = function()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- List the servers you have installed via Mason
    local servers = { "lua_ls", "gopls", "clangd" }

    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
        settings = server == "lua_ls" and {
          Lua = { diagnostics = { globals = { "vim" } } }
        } or {},
        -- Force root directory detection
        root_dir = vim.fs.root(0, { ".git", "go.mod", ".clangd", "init.lua", "setup.py", "Cargo.toml" }) or vim.fn.getcwd(),
      })
      vim.lsp.enable(server)
    end

    -- Diagnostics (Make errors visible!)
    vim.diagnostic.config({
      virtual_text = { prefix = '●', spacing = 4 },
      underline = true,
      severity_sort = true,
      float = { border = "rounded" },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
        },
      },
    })
  end,
}