return {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("textcase").setup({prefix = "<leader>o" })
        require("telescope").load_extension("textcase")
        vim.keymap.set('n', '<leader>to', '<cmd>TextCaseOpenTelescope<CR>', { desc = "TextCase convert" })
    end,
    keys = {"<leader>o"}
}
