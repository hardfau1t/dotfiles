local mappings = {
}

return {
    "folke/which-key.nvim",
    opts = {
        spec = {
             {"<leader>b", group = "buffer-management" },
             {"<leader>c", group = "comment" },
             {"<leader>d", group = "diagnostics" },
             {"<leader>h", group = "git-hunks(neogit)" },
             {"<leader>l", group = "lsp" },
             {"<leader>o", group = "text-case" },
             {"<leader>t", group = "telescope" },
             {"<leader>s", group = "source" },
             {"<leader>,", group = "snippets" },
        }
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = true })
            end,
            desc = "Buffer Local Keymaps (which-key)"
        },
        {
            "<C-W>",
            function()
                require("which-key").show({keys = "<c-w>", loop = true})
            end
        }
    },
    dependencies = {"echasnovski/mini.icons"}

}
