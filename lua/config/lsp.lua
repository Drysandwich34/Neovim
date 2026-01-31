local lspconfig = require('lspconfig')

local capabilities = require('blink.cmp').get_lsp_capabilities()

-- List the servers you have installed via Mason
local servers = { "lua_ls", "gopls", "clangd" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    settings = server == "lua_ls" and {
      Lua = { diagnostics = { globals = { "vim" } } }
    } or {},
  })
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