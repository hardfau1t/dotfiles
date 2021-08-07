local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<C-n>', ':cnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-p>', ':cprev<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>qo', ':copen<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>qq', ':cclose<CR>', opts)
vim.api.nvim_set_keymap('n', '<esc>', ':cclose<CR>', opts)
