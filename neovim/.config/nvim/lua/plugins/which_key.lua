local opts = {}
local mappings = {
    b = { name = "buffer-management" },
    c = { name = "comment" },
    d = { name = "diagnostics" },
    h = { name = "git-hunks(neogit)" },
    l = { name = "lsp" },
    o = { name = "text-case" },
    t = { name = "telescope" },
    s = { name = "source" },
}

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function ()
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(mappings, {prefix = "<leader>"})
    end
}
