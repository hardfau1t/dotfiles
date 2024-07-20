local opts = {}
local mappings = {
    b = { name = "buffer-management" },
    c = { name = "comment" },
    d = { name = "diagnostics" },
    h = { name = "git-hunks(neogit)" },
    l = { name = "lsp" },
    o = { name = "text-case" },
    t = { name = "telescope" },
    s = { name = "source" },
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
