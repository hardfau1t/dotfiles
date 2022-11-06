local mod = {}

mod.setup = function()
    vim.keymap.set("n", "<leader>mt", "<Plug>MarkdownPreviewToggle", {silent = true})
    vim.keymap.set("n", "<leader>mp", "<Plug>MarkdownPreview", {silent = true})
    vim.keymap.set("n", "<leader>ms", "<Plug>MarkdownPreviewStop", {silent = true})
end

return mod
