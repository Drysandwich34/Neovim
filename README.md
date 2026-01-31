# Drysandwich34's Neovim Configuration

A clean and functional Neovim configuration with LSP support, autocompletion, and essential plugins.

## Features

- 🚀 **LSP Support** - Lua, Go, C/C++ language servers with autocompletion
- 🔍 **Fuzzy Finding** - Telescope for file navigation
- 🌳 **Undo Tree** - Persistent undo history across sessions
- 🎨 **Syntax Highlighting** - Treesitter for better code highlighting
- 📦 **Plugin Management** - Lazy.nvim for fast startup
- 🔧 **Mason** - Automatic LSP server installation

## Key Mappings

- `<leader>e` - File explorer
- `<leader>f` - Telescope find files
- `<leader>u` - Toggle undo tree
- `<leader>rn` - LSP rename
- `<leader>ca` - LSP code action
- `<leader>d` - Show diagnostics
- `gd` - Go to definition
- `K` - Hover documentation
- `jk` - Exit insert mode

## Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/Drysandwich34/Neovim.git ~/.config/nvim
   ```

2. Open Neovim - plugins will install automatically

3. Install language servers:
   ```bash
   :Mason
   ```

## Requirements

- Neovim 0.11+
- Git
- Language servers (installed via Mason)

## Plugins

- **Lazy.nvim** - Plugin manager
- **nvim-lspconfig** - LSP configurations
- **blink.cmp** - Autocompletion
- **telescope.nvim** - Fuzzy finder
- **nvim-treesitter** - Syntax highlighting
- **mason.nvim** - LSP installer
- **undotree** - Undo visualization
- **onedark.nvim** - Color scheme

## Persistent Undo

Configuration includes persistent undo history - you can undo changes even after closing and reopening Neovim.