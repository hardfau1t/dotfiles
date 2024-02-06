local opts = { buffer = false, silent = true }

vim.keymap.set("n", "<leader>qo", ":copen<CR>", opts)
vim.keymap.set("n", "<leader>qq", ":cclose<CR>", opts)
vim.keymap.set("n", "<esc>", ":cclose<CR>", opts)
