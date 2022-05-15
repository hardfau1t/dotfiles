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
            "python",
            "norg",
            "norg_meta",
            "lua",
            "bash",
            "html",
            "css",
            "yaml",
            "toml",
            "json",
        },
        highlight = {
            enable = true, -- false will disable the whole extension
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
