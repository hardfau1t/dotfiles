return {
    "danymat/neogen",
    config = function()
        local neogen = require("neogen")
        neogen.setup({ snippet_engine = "luasnip" })
        vim.keymap.set("n", "<leader>ls", neogen.generate, { desc = "generate signatures" })
        vim.keymap.set("i", "<c-s>", neogen.generate, { desc = "generate signatures" })
    end,
}
