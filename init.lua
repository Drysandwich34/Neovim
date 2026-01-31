vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Persistent undo
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('data') .. '/undodir'


require("config.lazy")
require("lazy").setup("plugins")

local builtin = require('telescope.builtin')

-- Set the leader key to the spacebar
-- Map <leader>e to open the :Ex command in normal mode
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open Ex mode (file explorer)" })
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Telescope find files' })
vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle UndoTree' })

-- LSP mappings
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostics' })


