local mod = {}
function mod.setup()
	local present, ts = pcall(require, "nvim-treesitter.configs")
	if not present then
		print("treesitter is not installed")
		return
	end
	ts.setup({
		ensure_installed = {
			"rust",
			"c",
			"python",
			"norg",
			"norg_meta",
			"norg_table",
			"lua",
			"bash",
			"html",
			"css",
			"yaml",
			"toml",
			"json",
		},
		highlight = {
			enable = true,              -- false will disable the whole extension
		},
		indent = {
			enable = false,
		},
		incremental_selection = {
			enable = true,
		},
	})
end

return mod
