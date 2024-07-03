local config = {
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "css",
            "html",
            "json",
            "lua",
            "markdown",
            "norg",
            "python",
            "rust",
            "sql",
            "toml",
            "yaml",
            "vim",
            "vimdoc",
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = false,
        },
        incremental_selection = {
            enable = true,
        },
    } 
return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter").setup(config)
    end,
}
