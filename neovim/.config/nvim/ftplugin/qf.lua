local opts = { buffer = true, silent = true }

vim.keymap.set("n", "<C-n>", ":cnext<CR>", opts)
vim.keymap.set("n", "<C-p>", ":cprev<CR>", opts)
vim.keymap.set("n", "<leader>qo", ":copen<CR>", opts)
vim.keymap.set("n", "<leader>qq", ":cclose<CR>", opts)
vim.keymap.set("n", "<leader>ql", ":cnewer<CR>", opts)
vim.keymap.set("n", "<leader>qh", ":colder<CR>", opts)
vim.keymap.set("n", "<esc>", ":cclose<CR>", opts)
