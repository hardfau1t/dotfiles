local mod = {}

mod.set_keymaps = function(kb)
    -- Keys for managing TODO items and setting their states
    kb.remap_event("norg", "n", kb.leader .. "td", "core.norg.qol.todo_items.todo.task_done")
    kb.remap_event("norg", "n", kb.leader .. "tu", "core.norg.qol.todo_items.todo.task_undone")
    kb.remap_event("norg", "n", kb.leader .. "tp", "core.norg.qol.todo_items.todo.task_pending")
    kb.remap_event("norg", "n", kb.leader .. "th", "core.norg.qol.todo_items.todo.task_on_hold")
    kb.remap_event("norg", "n", kb.leader .. "tc", "core.norg.qol.todo_items.todo.task_cancelled")
    kb.remap_event("norg", "n", kb.leader .. "tr", "core.norg.qol.todo_items.todo.task_recurring")
    kb.remap_event("norg", "n", kb.leader .. "ti", "core.norg.qol.todo_items.todo.task_important")
    kb.remap_event("norg", "n", "<C-c>", "core.norg.qol.todo_items.todo.task_cycle")
    -- keys for managing GTD
    kb.remap_event("norg", "n", kb.leader .. "tc", "core.gtd.base.capture")
    kb.remap_event("norg", "n", kb.leader .. "tv", "core.gtd.base.views")
    kb.remap_event("norg", "n", kb.leader .. "te", "core.gtd.base.edit")
    -- keys for managing notes
    kb.map("norg", "n", kb.leader .. "nn", "core.norg.dirman.new.note")
    kb.remap_event("norg", "n", "<C-CR>", "core.norg.esupports.hop.hop-link")
    kb.remap_event("norg", "n", "<M-CR>", "core.norg.esupports.hop.hop-link", "vsplit")
    kb.remap_event("norg", "n", "<M-k>", "core.norg.manoeuvre.item_up")
    kb.remap_event("norg", "n", "<M-j>", "core.norg.manoeuvre.item_down")
    -- mnemonic: markup toggle
    kb.remap_event("norg", "n", "mt", "core.norg.concealer.toggle-markup")
    kb.remap_event("norg", "n", "<C-s>", "core.integrations.telescope.find_linkable")
    kb.remap_event("norg", "i", "<C-l>", "core.integrations.telescope.insert_link")
    -- journal shortcuts
    kb.map("norg", "n", kb.leader .. "jt", ":Neorg journal today<CR>")
    kb.map("norg", "n", kb.leader .. "jy", ":Neorg journal yesterday<CR>")
    kb.map("norg", "n", kb.leader .. "jm", ":Neorg journal tomorrow<CR>")
    -- Table of content
    kb.map("norg", "n", kb.leader .. "cs", ":Neorg toc split<CR>")
    kb.map("norg", "n", kb.leader .. "cc", ":Neorg toc close<CR>")
    kb.map("norg", "n", kb.leader .. "cq", ":Neorg toc toqflist<CR>")
end

local opts = { noremap = true, silent = false }
vim.api.nvim_set_keymap("n", "\\", "<nop>", opts)
vim.api.nvim_set_keymap("n", "\\<space>", ":NeorgStart<CR>", opts)
return mod
