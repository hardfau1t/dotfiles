local config = function()
    -- Lua
    vim.keymap.set("n", "<leader>mm", require("grapple").toggle)
    vim.keymap.set("n", "<leader>mM", require("grapple").toggle_tags)

    -- User command
    vim.keymap.set("n", "<leader>ms", "<cmd>Grapple select index=1<cr>")
end
return {
    "cbochs/grapple.nvim",
    config = config
}
