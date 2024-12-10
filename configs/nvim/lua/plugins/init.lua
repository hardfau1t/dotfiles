-- plugins without any configurations

return {
    { "imsnif/kdl.vim" }, -- kdl support for vim
    {
        -- diagnostics looks cool
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
    },
    "folke/neodev.nvim",
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        opts = {
            auto_resize_height = true,
        },
    },
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = { {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim" -- Optional
        } },
    },
    {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        }
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true
    },
    "neovim/nvim-lspconfig",
    "j-hui/fidget.nvim",
}
