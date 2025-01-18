vim.opt.spell = false
vim.keymap.set('n', '<leader>rr', '<cmd>.lua<CR>', {desc = "run current line of lua code"})
vim.keymap.set('v', '<leader>rr', [[<cmd>'<,'>lua<CR>]], {desc = "run current selection in lua"})
vim.keymap.set('n', '<leader>r<leader>', '<cmd>source %<CR>', {desc = "run and source entire lua file"})
