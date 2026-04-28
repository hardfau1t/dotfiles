local langs = {
    "bash",
    "c",
    "cpp",
    "css",
    "html",
    "json",
    "lua",
    "markdown",
    "make",
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
}


return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    config = function(_, opts)
        require("nvim-treesitter").install(langs)
    end,
    -- dependencies = {
    --     { "nushell/tree-sitter-nu" }
    -- },
    build = ":TSUpdate"
}
