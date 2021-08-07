local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>tl', ':Telescope colorscheme<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tgc', ':Telescope git_commits<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tgs', ':Telescope git_status<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>t<space>', ':lua require("telescope.builtin").find_files({follow=true})<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tg<space>', ':Telescope git_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>tc', ':Telescope commands<CR>', opts)
