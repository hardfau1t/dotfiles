local M = {}
local custom_attach = function (_, bufnr)
    require("cfg.lsp.keymaps").setup(bufnr)
end

M.setup = function()
	local opts = {
		server = {
			settings = {
				["rust-analyzer"] = {
					assist = {
						importMergeBehavior = "last",
						importPrefix = "by_self",
					},
					checkOnSave = {
						command = "clippy",
					},
					rustfmt = {
						extraArgs = { "--config", "tab_spaces=2" },
					},
				},
			},
                        on_attach = custom_attach,
		},
	}
	require("rust-tools").setup(opts)
end

return M
