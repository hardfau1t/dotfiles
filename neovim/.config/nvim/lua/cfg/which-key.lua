do
    local opts = {}
    local mappings = {
        b = {name = "buffer-management"},
        c = {name = "comment"},
        d = {name = "diagnostics"},
        h = {name = "git-hunks(neogit)"},
        l = {name = "lsp"},
        o = {name = "text-case"},
        t = {name = "telescope"},
        s = {name = "source"},
    }
    local status, mod = pcall(require, "which-key")
    if status then
        mod.setup(opts)
        mod.register(mappings, {prefix = "<leader>"})
    else
        vim.notify("which key is not installed", vim.log.levels.WARN)
    end
end
