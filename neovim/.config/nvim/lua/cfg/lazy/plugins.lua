return {
    { "folke/tokyonight.nvim", lazy = true },
    { "imsnif/kdl.vim" }, -- kdl support for vim
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavor = "mocha",
                transparent_background = false,
                dim_inactive = {
                    enabled = true,
                }
            })
        end
    },
    { "morhetz/gruvbox",          lazy = true },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = "true",
        config = function()
            require("kanagawa").setup({
                dimInactive = false,
                globalStatus = true,
                transparent = true,
            })
        end,
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
        dependencies = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
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
        lazy = true,
        build = ":call mkdp#util#install()",
        ft = { "markdown" },
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
        "kyazdani42/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("cfg.nvim-tree").setup()
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
        lazy = false,
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
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            local dashboard = require('dashboard')
            local pokemon = require('pokemon')
            pokemon.setup({
                number = 'random',
                size = 'auto',
            })
            dashboard.setup {
                config = {
                    header = pokemon.header()
                }
            }
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons', 'ColaMint/pokemon.nvim' } }
    },
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
}
