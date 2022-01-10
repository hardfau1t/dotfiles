local mod = {}

function mod.setup()
	local present, comment = pcall(require, "Comment")
	if not present then
		print("comment-nvim is not installed")
		return
	end
	comment.setup({
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
		}
	})
end

return mod
