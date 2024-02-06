return {

    { "imsnif/kdl.vim" }, -- kdl support for vim
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
            hide_inactive_statusline = false,
            dim_inactive = true,
            lualine_bold = false,
        },
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                disable_in_macro = true,
                map_c_w = true,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("cfg.treesitter").setup()
        end,
    },
    {
        "nvim-treesitter/playground",
        lazy = true,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("cfg.indent_blankline").setup()
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            require("cfg.fugitive").setup()
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("cfg.comment_nvim").setup()
        end,
    },
    {
        -- diagnostics looks cool
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("cfg.telescope").setup()
        end,
    },

    {
        "nvim-neorg/neorg",
        lazy = true,
        -- load only when neorg cmd ran or shortcut is given
        cmd = { "Neorg workspace", "Neorg index", "Neorg" },
        keys = { "\\\\" },
        config = function()
            require("cfg.neorg").init()
        end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope", { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } } },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("cfg.lua_line")
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip/loaders/from_vscode").lazy_load()
        end,
        dependencies = "rafamadriz/friendly-snippets"
    },
    {
        "rafamadriz/friendly-snippets",
        dependencies = { "L3MON4D3/LuaSnip" },
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("cfg.oil").setup()
        end,
    },
    {
        'j-hui/fidget.nvim', -- lsp status
        tag = 'legacy'
    },
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('cfg.lsp.symbols').setup()
        end
    },
    {
        'simrat39/inlay-hints.nvim',
        config = function()
            require("inlay-hints").setup({
                renderer = "inlay-hints/render/eol",
                autoclose = true,
                hints = {
                    parameter = {
                        show = false,
                    }
                }
            })
        end,
        lazy = true,
        ft = { "rust" }
    },
    {
        'anuvyklack/pretty-fold.nvim',
        disable = true,
        config = function()
            require('pretty-fold').setup({ fill_char = " " })
        end
    },
    "neovim/nvim-lspconfig",
    {
        'LhKipp/nvim-nu',
        lazy = true,
        build = ":TSInstall nu",
        ft = { "nu" },
        config = function()
            require("nu").setup({ use_lsp_features = false })
        end
    },
    -- nvim cmp plugin and sources
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("cfg.nvim-cmp").setup()
        end,
    },
    { "saadparwaiz1/cmp_luasnip", dependencies = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" } },      -- luasnip completion support
    { "hrsh7th/cmp-nvim-lsp",     dependencies = { "hrsh7th/nvim-cmp" } },                          -- basic lsp cmp
    { "hrsh7th/cmp-buffer",       dependencies = { "hrsh7th/nvim-cmp" } },                          -- buffer words completion
    { "hrsh7th/cmp-path",         dependencies = { "hrsh7th/nvim-cmp" } },                          -- path completion
    { "hrsh7th/cmp-nvim-lua",     dependencies = { "hrsh7th/nvim-cmp" } },                          -- lua completion source
    { "onsails/lspkind-nvim",     dependencies = { "hrsh7th/nvim-cmp" } },                          -- lsp completion formatting
    { "petertriho/cmp-git",       dependencies = { "hrsh7th/nvim-cmp", "nvim-lua/plenary.nvim" } }, -- vim spell check
    {
        'NoahTheDuke/vim-just',
        lazy = true,
        ft = { "just" }
    },
    { 'elkowar/yuck.vim', lazy = true, ft = { "yuck" } },
    {
        "SmiteshP/nvim-navbuddy",
        dependencies = { {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim",
            "numToStr/Comment.nvim",        -- Optional
            "nvim-telescope/telescope.nvim" -- Optional
        } },
    },
    {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    },
    {
        "benfowler/telescope-luasnip.nvim",
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {}
    },
    -- for copying remote to system clipboard
    {
        'ojroques/nvim-osc52',
        config = function()
            require("cfg.osc52").setup()
        end
    },
    -- for converting word casing
    {
        "johmsalas/text-case.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("cfg.text-case").setup()
        end,
    }
}
