local avail, wk = pcall(require, "which-key")

if not avail then
	print("which key is required")
	return
end

wk.register({
	g = {
		name = "Git commands",
		g = {
			name = "diffget",
			u = { ":diffget //2<CR>", "take from left side" },
			h = { ":diffget //3<CR>", "take from right side" },
		},
		s = { ":Git<CR>", "status" },
		c = { ":Git commit<CR>", "commit" },
		p = { ":Git push<CR>", "push" },
	}}, { prefix = "<leader>" })
