vim.keymap.set("n", "<leader>mt", "<Plug>MarkdownPreviewToggle", { silent = true, buffer = true })
vim.keymap.set("n", "<leader>mp", "<Plug>MarkdownPreview", { silent = true, buffer = true })
vim.keymap.set("n", "<leader>ms", "<Plug>MarkdownPreviewStop", { silent = true, buffer = true })

vim.wo.spell = true
