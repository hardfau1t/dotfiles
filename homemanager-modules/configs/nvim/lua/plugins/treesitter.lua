local configs = {
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
        -- "norg_meta",
        "nu",
        "python",
        "rust",
        "regex",
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
    branch = "master",
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
    opts = configs,
    -- dependencies = {
    --     { "nushell/tree-sitter-nu" }
    -- },
    build = ":TSUpdate"
}
