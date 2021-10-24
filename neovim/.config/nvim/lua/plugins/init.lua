return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("yuttie/comfortable-motion.vim")
	use("nvim-treesitter/nvim-treesitter")
	use("vimwiki/vimwiki")
	use("morhetz/gruvbox")
	use("tpope/vim-fugitive")
	use("preservim/nerdcommenter")
	use("folke/tokyonight.nvim")
	use("L3MON4D3/LuaSnip")
	use("mhartington/formatter.nvim") -- formatter
    use {                                   -- diagnostics looks cool
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

    use({"simrat39/rust-tools.nvim",
        requires = {"neovim/nvim-lspconfig"}
    })
    use({
        "neovim/nvim-lspconfig",
        requires = {{"jose-elias-alvarez/null-ls.nvim", opt=true}, },
    })

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }


	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })

	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

    -- nvim cmp plugin and sources
	use({
		"hrsh7th/nvim-cmp",
		requires = { "neovim/nvim-lspconfig", { "nvim-lua/lsp_extensions.nvim", opt = true } },
	})
    use({ "hrsh7th/cmp-nvim-lsp", requires = { "hrsh7th/nvim-cmp" }})   -- basic lsp cmp
    use({ "hrsh7th/cmp-buffer", requires = { "hrsh7th/nvim-cmp" }})     -- buffer words completion
    use({ "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" }})       -- path completion
    use({ "hrsh7th/cmp-nvim-lua", requires = { "hrsh7th/nvim-cmp" }})   -- lua completion source
    use({ "saadparwaiz1/cmp_luasnip", requires = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip"}})   -- luasnip completion support
    use({ "onsails/lspkind-nvim", requires = { "hrsh7th/nvim-cmp" }})   -- lsp completion formatting
    use({ "f3fora/cmp-spell", requires = { "hrsh7th/nvim-cmp" }})       -- vim spell check
end)
