return {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("textcase").setup({ default_keymappings_enabled = true, prefix = "<leader>o" })
        require("telescope").load_extension("textcase")
        vim.keymap.set('n', '<leader>to', '<cmd>TextCaseOpenTelescope<CR>', { desc = "TextCase convert" })
    end,
}
