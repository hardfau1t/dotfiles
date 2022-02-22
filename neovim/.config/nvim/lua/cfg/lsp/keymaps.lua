local mod = {}
local buf_keymap = vim.api.nvim_buf_set_keymap

mod.setup = function(bufn)
	local opts = { noremap = true, silent = true }
    local avail, wk = pcall(require, "which-key")
    if not avail then
        print("which key is required")
        return
    end
	buf_keymap(bufn, "i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_keymap(bufn, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_keymap(bufn, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_keymap(bufn, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_keymap(bufn, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	wk.register({
		l = {
			name = "Lsp",
			w = {
				name = "workspace actions",
				a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "add folder" },
				r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "remove folder" },
				l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "list folders" },
			},
			p = { "<cmd>lua require'lsp.utils'.PeekDefinition()<CR>", "peak definition" },
			h = { "<Cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
			s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature" },
			r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
			t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition" },
			f = { "<cmd>lua vim.lsp.buf.formatting()<CR>]]", "format" },
			T = { "<cmd>LspStop<CR>", "Stop" },
			i = { "<cmd>LspInfo<CR>", "Info" },
			R = { "<cmd>LspRestart<CR>", "Restart" },
		},
		d = {
			name = "diagnostics",
			o = { "<cmd>lua vim.diagnostic.open_float()<CR>", "open" },
			p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "previous" },
			n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next" },
			s = { "<cmd>lua vim.diagnostic.show()<CR>", "show" },
			h = { "<cmd>lua vim.diagnostic.hide()<CR>", "hide" },
			d = { "<cmd>lua vim.diagnostic.disable()<CR>", "disable" },
			e = { "<cmd>lua vim.diagnostic.enable()<CR>", "enable" },
			q = { "<cmd>lua vim.diagnostic.toqflist()<CR>", "to quickfix list" },
		},
    },{ prefix = "<leader>", buffer = bufn })
end
return mod
