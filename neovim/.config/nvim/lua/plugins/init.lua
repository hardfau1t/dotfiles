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
    use {                               -- firenvim neovim inside browser
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end 
    }
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


	use({
		"hrsh7th/nvim-compe",
		requires = { "neovim/nvim-lspconfig", { "nvim-lua/lsp_extensions.nvim", opt = true } },
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } })

	use({
		"glepnir/galaxyline.nvim",
		branch = "main",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
end)
