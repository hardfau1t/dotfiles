local opts = { noremap = true, silent = false }
local neorg_leader = "<CR>"

vim.api.nvim_set_keymap("n", "<CR>", "<nop>", opts)
vim.api.nvim_set_keymap("n", "<CR><space>", ":NeorgStart<CR>", opts)

-- Require the user callbacks module, which allows us to tap into the core of Neorg
local neorg_callbacks = require("neorg.callbacks")

-- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
-- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
-- needs to reevaluate all the bound keys is invoked
neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
	-- Map all the below keybinds only when the "norg" mode is active
	keybinds.map_event_to_mode("norg", {
		n = {
			-- Keys for managing TODO items and setting their states
			{ neorg_leader .. "td", "core.norg.qol.todo_items.todo.task_done" },
			{ neorg_leader .. "tu", "core.norg.qol.todo_items.todo.task_undone" },
			{ neorg_leader .. "tp", "core.norg.qol.todo_items.todo.task_pending" },
			{ neorg_leader .. "th", "core.norg.qol.todo_items.todo.task_on_hold" },
			{ neorg_leader .. "tc", "core.norg.qol.todo_items.todo.task_cancelled" },
			{ neorg_leader .. "tr", "core.norg.qol.todo_items.todo.task_recurring" },
			{ neorg_leader .. "ti", "core.norg.qol.todo_items.todo.task_important" },
			{ "<C-c>", "core.norg.qol.todo_items.todo.task_cycle" },
			-- Keys for managing GTD
			{ neorg_leader .. "tc", "core.gtd.base.capture" },
			{ neorg_leader .. "tv", "core.gtd.base.views" },
			{ neorg_leader .. "te", "core.gtd.base.edit" },

			-- Keys for managing notes
			{ neorg_leader .. "nn", "core.norg.dirman.new.note" },

			{ "<C-CR>", "core.norg.esupports.hop.hop-link" },
			{ "<M-CR>", "core.norg.esupports.hop.hop-link", "vsplit" },

			{ "<M-k>", "core.norg.manoeuvre.item_up" },
			{ "<M-j>", "core.norg.manoeuvre.item_down" },

			-- mnemonic: markup toggle
			{ neorg_leader .. "mt", "core.norg.concealer.toggle-markup" },

			{ "<C-s>", "core.integrations.telescope.find_linkable" },
		},

		o = {
			{ "ah", "core.norg.manoeuvre.textobject.around-heading" },
			{ "ih", "core.norg.manoeuvre.textobject.inner-heading" },
			{ "at", "core.norg.manoeuvre.textobject.around-tag" },
			{ "it", "core.norg.manoeuvre.textobject.inner-tag" },
			{ "al", "core.norg.manoeuvre.textobject.around-whole-list" },
		},
		i = {
			{ "<C-l>", "core.integrations.telescope.insert_link" },
		},
	}, {
		silent = true,
		noremap = true,
	})

	-- Map the below keys only when traverse-heading mode is active
	keybinds.map_event_to_mode("traverse-heading", {
		n = {
			-- Rebind j and k to move between headings in traverse-heading mode
			{ "j", "core.integrations.treesitter.next.heading" },
			{ "k", "core.integrations.treesitter.previous.heading" },
		},
	}, {
		silent = true,
		noremap = true,
	})

	-- Map the below keys on gtd displays
	keybinds.map_event_to_mode("gtd-displays", {
		n = {
			{ "<CR>", "core.gtd.ui.goto_task" },

			-- Keys for closing the current display
			{ "q", "core.gtd.ui.close" },
			{ "<Esc>", "core.gtd.ui.close" },

			{ "e", "core.gtd.ui.edit_task" },
			{ "<Tab>", "core.gtd.ui.details" },
		},
	}, {
		silent = true,
		noremap = true,
		nowait = true,
	})

	-- Map the below keys on presenter mode
	keybinds.map_event_to_mode("presenter", {
		n = {
			{ "<CR>", "core.presenter.next_page" },
			{ "l", "core.presenter.next_page" },
			{ "h", "core.presenter.previous_page" },

			-- Keys for closing the current display
			{ "q", "core.presenter.close" },
			{ "<Esc>", "core.presenter.close" },
		},
	}, {
		silent = true,
		noremap = true,
		nowait = true,
	})
	-- Apply the below keys to all modes
	keybinds.map_to_mode("all", {
		n = {
			{ neorg_leader .. "mn", ":Neorg mode norg<CR>" },
			{ neorg_leader .. "mh", ":Neorg mode traverse-heading<CR>" },
		},
	}, {
		silent = true,
		noremap = true,
	})
end)
