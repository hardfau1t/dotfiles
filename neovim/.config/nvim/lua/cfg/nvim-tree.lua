local mod = {}

function mod.setup()
	local status, ntree = pcall(require, "nvim-tree")
	if not status then
        print("nvim-tree is not installed")
		return
	end
	-- default mappings
	local options = {
        disable_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = true,
	}
	ntree.setup(options)
	-- keymaps
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {silent=true})
end

return mod
