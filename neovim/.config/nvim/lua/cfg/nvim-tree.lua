local mod = {}

function mod.setup()
	local status, ntree = pcall(require, "nvim-tree")
	if not status then
        print("nvim-tree is not installed")
		return
	end
	local config = require("nvim-tree.config")
	local tree_cb = config.nvim_tree_callback
	-- default mappings
	local options = {
		update_cwd = true,
		view = {
			mappings = {
				list = {
		{ key =  "<CR>", cb = tree_cb("edit") },
		{ key = "o", cb = tree_cb("cd") },
		{ key = "<C-h>", cb = tree_cb("split") },
	},
			},
		},
	}
	ntree.setup(options)
	-- keymaps
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {silent=true})
end

return mod
