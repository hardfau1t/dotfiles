local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>fu', ':diffget //2<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ':diffget //3<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', {silent = true})
