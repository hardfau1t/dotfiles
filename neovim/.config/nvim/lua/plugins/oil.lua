local function setup()
    local opts = {
        float = {
            max_width = 60,
            max_height = 30,
        },
        use_default_keymaps = false,
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = "actions.select_vsplit",
            ["<C-h>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["q"] = "actions.close",
            ["<esc>"] = "actions.close",
            ["<C-l>"] = "actions.refresh",
            ["<leader>e"] = "actions.refresh",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
        },
    }
    require("oil").setup(opts)
    vim.keymap.set("n", "<leader>e", "<cmd>Oil --float<CR>", {desc = "Open oil explorer"})

end

return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        setup()
    end,
}
