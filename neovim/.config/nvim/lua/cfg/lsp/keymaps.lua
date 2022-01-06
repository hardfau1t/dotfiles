local mod = {}
mod.setup = function(bufn)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>lp", "<cmd>lua require'lsp.utils'.PeekDefinition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>lh", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn,
		"n",
		"<leader>lwl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>lD", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>ld", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn,
		"n",
		"<leader>lf",
		[[<cmd>lua vim.lsp.buf.formatting({tabSize=4, IndentWidth=4})<CR>]],
		opts
	)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>lT", "<cmd>LspStop<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>li", "<cmd>LspInfo<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufn, "n", "<leader>lR", "<cmd>LspRestart<CR>", opts)
end
return mod
