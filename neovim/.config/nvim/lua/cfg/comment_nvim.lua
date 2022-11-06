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
            eol = "<leader>ca",
        },
        mappings = {
            basic = "toggler",
        },
        opleader = {
            line = "<leader>cc",
            block = "<leader>cb",
        },
    })
end

return mod
