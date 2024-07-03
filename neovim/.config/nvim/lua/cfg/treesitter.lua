do
    local present, ts = pcall(require, "nvim-treesitter.configs")
    if not present then
        vim.api.nvim_notify("treesitter is not installed", vim.log.levels.ERROR)
        return
    end

    ts.setup({
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
    })
end
