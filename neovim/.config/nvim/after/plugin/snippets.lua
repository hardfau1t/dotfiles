local status, ls = pcall(require, "luasnip")
local level = vim.log.levels

if not status then
    vim.notify("luasnip is not present, cannot add snippets", level.WARN)
    return
end


-- keymaps
vim.keymap.set('n', "<leader>,l", require'telescope'.extensions.luasnip.luasnip, {silent = true, desc = "show all available snippets"})
vim.keymap.set('n', "<leader>,s", "<cmd>source ~/.config/nvim/after/plugin/snippets.lua<CR>")

local s = ls.s

local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmta
local snippets = {
        s("desc", fmt([[<description>

Ticket/issue: <ticket_link>

Notes: <notes>

Dependencies: <dependencies>

<final>
        ]], {
            description = i(1, "description"),
            ticket_link = i(2),
            notes = i(3),
            dependencies = i(4),
            final = i(0)
        }))
}

ls.add_snippets( "gitcommit", snippets , { key= "gitcommit" })
ls.add_snippets( "NeogitCommitMessage", snippets , { key= "neogitcommit" })
