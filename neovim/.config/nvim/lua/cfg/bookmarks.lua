local mod = {}

local function setup_keymaps()
    local bk_list = require('bookmarks.list')
    local bk = require("bookmarks")
    vim.keymap.set("n", "<leader>mm", bk.add_bookmarks, { silent = true, desc = "add bookmark" })
    vim.keymap.set("n", "<leader>mt", bk.toggle_bookmarks, { silent = true, desc = "toggle bookmark" })
    vim.keymap.set("n", "<leader>mi", bk_list.show_desc, { silent = true, desc = "show bookmark info" })
    vim.keymap.set("n", "<leader>md", bk_list.delete_on_virt, { silent = true, desc = "delete bookmark" })
end

mod.setup = function()
    local opts = {
        mappings_enabled = false,
        virt_pattern = {"*"}
    }
    require("bookmarks").setup(opts)
    require("telescope").load_extension("bookmarks")
    setup_keymaps()
end

return mod
