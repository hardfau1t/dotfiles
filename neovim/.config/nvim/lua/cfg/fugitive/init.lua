local mod = {}
function mod.setup()
    vim.keymap.set("n", "<leader>gs", ":Git<CR>", {silent = true})
    vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {silent = true})
    vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {silent = true})
    vim.keymap.set("n", "<leader>gp", ":Git push -f<CR>", {silent = true})
end

return mod
