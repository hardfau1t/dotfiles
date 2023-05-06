local mod = {}
function mod.setup()
    local present, ts = pcall(require, "nvim-treesitter.configs")
    if not present then
        vim.api.nvim_notify("treesitter is not installed", vim.log.levels.ERROR)
        return
    end

    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    ts.setup({
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "css",
            "html",
            "json",
            "lua",
            "norg",
            "nu",
            "python",
            "rust",
            "toml",
            "yaml",
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

return mod
