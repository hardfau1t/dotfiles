local mod = {}

mod.set_keymaps = function(kb)
	-- Keys for managing TODO items and setting their states
	kb.unmap("norg", "n", "gtu")
	kb.unmap("norg", "n", "gtp")
	kb.unmap("norg", "n", "gtd")
	kb.unmap("norg", "n", "gth")
	kb.unmap("norg", "n", "gtc")
	kb.unmap("norg", "n", "gtr")
	kb.unmap("norg", "n", "gti")
	kb.remap_event("norg", "n", "td", "core.norg.qol.todo_items.todo.task_done")
	kb.remap_event("norg", "n", "tu", "core.norg.qol.todo_items.todo.task_undone")
	kb.remap_event("norg", "n", "tp", "core.norg.qol.todo_items.todo.task_pending")
	kb.remap_event("norg", "n", "th", "core.norg.qol.todo_items.todo.task_on_hold")
	kb.remap_event("norg", "n", "tc", "core.norg.qol.todo_items.todo.task_cancelled")
	kb.remap_event("norg", "n", "tr", "core.norg.qol.todo_items.todo.task_recurring")
	kb.remap_event("norg", "n", "ti", "core.norg.qol.todo_items.todo.task_important")
	kb.remap_event("norg", "n", "<C-c>", "core.norg.qol.todo_items.todo.task_cycle")
	-- keys for managing GTD
	kb.remap_event("norg", "n", "tc", "core.gtd.base.capture")
	kb.remap_event("norg", "n", "tv", "core.gtd.base.views")
	kb.remap_event("norg", "n", "te", "core.gtd.base.edit")

	-- keys for managing notes
	kb.remap_event("norg", "n", "nn", "core.norg.dirman.new.note")

	kb.remap_event("norg", "n", "<CR>", "core.norg.esupports.hop.hop-link")
	kb.remap_event("norg", "n", "<M-CR>", "core.norg.esupports.hop.hop-link", "vsplit")

	kb.remap_event("norg", "n", "<M-k>", "core.norg.manoeuvre.item_up")
	kb.remap_event("norg", "n", "<M-j>", "core.norg.manoeuvre.item_down")

	-- mnemonic: markup toggle
	kb.remap_event("norg", "n", "mt", "core.norg.concealer.toggle-markup")

	kb.remap_event("norg", "n", "<C-s>", "core.integrations.telescope.find_linkable")

	-- journal shortcuts
	kb.map("norg", "n", "jt", ":Neorg journal today<CR>")
	kb.map("norg", "n", "jy", ":Neorg journal yesterday<CR>")
	kb.map("norg", "n", "jm", ":Neorg journal tomorrow<CR>")
	-- Table of content
	kb.map("norg", "n", "cs", ":Neorg toc split<CR>")
	kb.map("norg", "n", "cc", ":Neorg toc close<CR>")
	kb.map("norg", "n", "cq", ":Neorg toc toqflist<CR>")
end

local opts = { noremap = true, silent = false }
vim.api.nvim_set_keymap("n", "<CR>", "<nop>", opts)
vim.api.nvim_set_keymap("n", "<CR><space>", ":NeorgStart<CR>", opts)
return mod
