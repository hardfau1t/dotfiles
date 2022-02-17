local avail, wk = pcall(require, "which-key")

if not avail then
	print("which key is required")
	return
end
wk.register({
	m = {
		name = "markdown preview",
		t = { "<Plug>MarkdownPreviewToggle", "Toggle" },
		p = { "<Plug>MarkdownPreview", "preview start" },
		s = { "<Plug>MarkdownPreviewStop", "preview stop" },
	},
}, { prefix = "<leader>" })
