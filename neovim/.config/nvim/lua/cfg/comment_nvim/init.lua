local mod = {}

function mod.setup()
    local comment = require("Comment")
    comment.setup({
        ignore = "^$",
        toggler = {
            line = "<leader>c<leader>",
            block = "<leader>cb",
        },
        extra = {
            above = "<leader>cO",
            below = "<leader>co",
            eol = "<leader>cA",
        },
        mappings = {
            basic = "toggler",
        },
        opleader = {
            line = "<leader>c",
            block = "<leader>b",
        },
    })
    local avail, wk = pcall(require, "which-key")
    if not avail then
        print("which key is required")
        return
    end
    wk.register({
        c = {
            name = "Comment",
            ["<leader>"] =  "line Toggle",
            b =  "block Toggle",
        },
    }, { prefix = "<leader>" })
end

return mod
