local mod = {}
function mod.setup()
    local present, ts = pcall(require, "nvim-treesitter.configs")
    if not present then
        print("treesitter is not installed")
        return
    end

    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    ts.setup({
        ensure_installed = {
            "rust",
            "c",
            "cpp",
            "python",
            "norg",
            "lua",
            "bash",
            "html",
            "css",
            "yaml",
            "toml",
            "json",
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
