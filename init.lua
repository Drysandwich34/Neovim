vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
--vim.opt.relativenumber = true     -- Enable relative numbers (hybrid mode)

-- Persistent undo
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undodir"

require("config.lazy")
require("lazy").setup("plugins")

local builtin = require("telescope.builtin")

-- Set the leader key to the spacebar
-- Map <leader>e to open the :Ex command in normal mode
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open Ex mode (file explorer)" })
vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, { desc = "Telescope find files" })
vim.keymap.set("i", "jk", "<Esc>", { silent = true })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })

-- LSP mappings
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- 2. TRANSPARENCY PERSISTENCE LOGIC
local transparency_file = vim.fn.stdpath("data") .. "/transparency_state"

local function apply_transparency(enabled)
	if enabled then
		-- Groups to make transparent (StatusLine is EXCLUDED to keep it solid)
		local groups = {
			"Normal",
			"NormalFloat",
			"SignColumn",
			"LineNr",
			"CursorLineNr",
			"EndOfBuffer",
			"VertSplit",
			"WinSeparator",
			"Folded",
			"Pmenu",
		}
		for _, group in ipairs(groups) do
			vim.api.nvim_set_hl(0, group, { bg = "none" })
		end
	else
		-- Restore colorscheme default (re-paints the background)
		vim.cmd("colorscheme " .. (vim.g.colors_name or "default"))
	end
end

-- Toggle function
local function toggle_transparency()
	local is_transparent = not (vim.g.is_transparent or false)
	vim.g.is_transparent = is_transparent

	-- Save to file
	local f = io.open(transparency_file, "w")
	if f then
		f:write(is_transparent and "1" or "0")
		f:close()
	end

	apply_transparency(is_transparent)
end

-- Load state on startup
local f = io.open(transparency_file, "r")
if f then
	local state = f:read("*all")
	f:close()
	if state == "1" then
		vim.g.is_transparent = true
		-- Apply after colorscheme has loaded
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				apply_transparency(true)
			end,
		})
	end
end

-- 3. COMMANDS & KEYMAPS
vim.api.nvim_create_user_command("ToggleTrans", toggle_transparency, {})
vim.keymap.set("n", "<leader>tt", toggle_transparency, { desc = "Toggle Transparency" })

-- 4. FORMAT ON SAVE (Conform + Prettier)
-- Conform.nvim handles formatting on save automatically
-- Format on save is configured in lua/plugins/conform.lua
