local mod = {}

function mod.setup()
	require("Comment").setup({
		toggler = {
			line = "<leader>cc",
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
	})
end

return mod
