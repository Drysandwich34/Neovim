return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua", "go", "c", "cpp", "vim", "vimdoc", "query" },
        sync_install = false,
        highlight = { 
            enable = true, 
        },
        indent = { enable = true },
    },
}
