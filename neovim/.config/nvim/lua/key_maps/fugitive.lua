local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>fu', ':diffget //2<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ':diffget //3<CR>', opts)
