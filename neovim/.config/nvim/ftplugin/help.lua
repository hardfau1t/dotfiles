local opts = { buffer = true, silent = true }
vim.keymap.set('n', '<esc>', ':q<CR>', opts)
vim.keymap.set('n', 'q', ':q<CR>', opts)
