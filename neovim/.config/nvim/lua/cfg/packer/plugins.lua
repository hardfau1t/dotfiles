local mod = {}
function mod.plugins()
    -- manage itself
    use("wbthomason/packer.nvim")
    -- colorschemes
    use({
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                dimInactive = true,
                globalStatus = true,
            })
            vim.cmd([[colorscheme kanagawa]])
        end,
    })
    use("folke/tokyonight.nvim")
    use("morhetz/gruvbox")

    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                disable_in_macro = true,
                map_c_w = true,
            })
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("cfg.treesitter").setup()
        end,
    })
    use({
        "nvim-treesitter/playground",
        requires = { "nvim-treesitter/nvim-treesitter" },
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("cfg.indent_blankline").setup()
        end,
    })
    use({
        "tpope/vim-fugitive",
        config = function()
            require("cfg.fugitive").setup()
        end,
    })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("cfg.comment_nvim").setup()
        end,
    })
    use({ -- diagnostics looks cool
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({})
        end,
    })
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
        config = function()
            require("cfg.telescope").setup()
        end,
    })

    use({
        "nvim-neorg/neorg",
        config = function()
            require("cfg.neorg").init()
        end,
        run = ":Neorg sync-parsers",
        requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("cfg.lua_line")
        end,
    })
    use({
        "iamcco/markdown-preview.nvim",
        run = ":call mkdp#util#install()",
        ft = { "markdown" },
    })
    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip/loaders/from_vscode").lazy_load()
        end,
    })
    use({
        "rafamadriz/friendly-snippets",
        requires = { "L3MON4D3/LuaSnip", required = true },
    })
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("cfg.nvim-tree").setup()
        end,
    })

    use 'j-hui/fidget.nvim' -- lsp status
    use({ 'simrat39/symbols-outline.nvim',
        config = function() require('cfg.lsp.symbols').setup()
        end
    })
    use({ 'simrat39/inlay-hints.nvim', config = function() require("inlay-hints").setup({
            renderer = "inlay-hints/render/eol",
            hints = {
                parameter = {
                    show = false,
                }
            }
        })
    end })
    use("neovim/nvim-lspconfig")
    use({
        'LhKipp/nvim-nu',
        config = function ()
            require("nu").setup({ complete_cmd_names = false})
        end
    })
    -- nvim cmp plugin and sources
    use({
        "hrsh7th/nvim-cmp",
        requires = { "neovim/nvim-lspconfig" },
        config = function()
            require("cfg.nvim-cmp").setup()
        end,
    })
    use({ "saadparwaiz1/cmp_luasnip", requires = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" } }) -- luasnip completion support
    use({ "hrsh7th/cmp-nvim-lsp", requires = { "hrsh7th/nvim-cmp" } }) -- basic lsp cmp
    use({ "hrsh7th/cmp-buffer", requires = { "hrsh7th/nvim-cmp" } }) -- buffer words completion
    use({ "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" } }) -- path completion
    use({ "hrsh7th/cmp-nvim-lua", requires = { "hrsh7th/nvim-cmp" } }) -- lua completion source
    use({ "onsails/lspkind-nvim", requires = { "hrsh7th/nvim-cmp" } }) -- lsp completion formatting
    use({ "petertriho/cmp-git", requires = { "hrsh7th/nvim-cmp", "nvim-lua/plenary.nvim" } }) -- vim spell check
    use 'NoahTheDuke/vim-just'
    use 'elkowar/yuck.vim'
end

return mod
