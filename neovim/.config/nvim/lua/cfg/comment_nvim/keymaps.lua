local M = {}

M.setup = function (){
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

    }
return M
