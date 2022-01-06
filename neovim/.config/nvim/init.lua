local fn = vim.fn

-- other configs
require("cfg.config")
require("cfg.colorscheme")
require("cfg.utils")
require("cfg.key_maps")
-- install packer if its not installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("installing packer")
	vim.cmd("packadd packer.nvim") -- add the packer to vim
end

-- auto load packer file if its written
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost */nvim/init.lua source <afile> | PackerCompile
	augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	print("Failed to load packer ")
	return
end

-- better to reset when re sourcing
packer.reset()
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

packer.startup(function()
	-- manage itself
	use("wbthomason/packer.nvim")
	-- colorschemes
	use("rebelot/kanagawa.nvim")
	use("folke/tokyonight.nvim")
	use("morhetz/gruvbox")
    --------------

	use({
		"yuttie/comfortable-motion.vim",
		config = require("cfg.comfortable-motion").setup
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		config = require("cfg.treesitter").setup
	})
	use({
		"tpope/vim-fugitive",
		config = require("cfg.fugitive").setup
	})
	use({
		"numToStr/Comment.nvim",
		config = require("cfg.comment_nvim.init").setup
	})
	use({ -- diagnostics looks cool
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = require("cfg.trouble").setup
	})
	use({
		"neovim/nvim-lspconfig",
		requires = { { "jose-elias-alvarez/null-ls.nvim", opt = true } },
		config = function()
            require("cfg.lsp").setup()
        end
	})

	use({
		"simrat39/rust-tools.nvim",
		requires = { "neovim/nvim-lspconfig" },
		config = require("cfg.rust_tools").setup,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = require("cfg.nvim-tree").setup
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = require("cfg.telescope").setup
	})
	use({
		"nvim-neorg/neorg",
		config = require("cfg.neorg").init,
		requires = {"nvim-lua/plenary.nvim",
		"nvim-neorg/neorg-telescope" }
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function ()
            require("cfg.lua_line")
        end,
	})
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- nvim cmp plugin and sources
	use({
		"hrsh7th/nvim-cmp",
		requires = { "neovim/nvim-lspconfig", },
		config = require("cfg.nvim-cmp").setup
	})
	use({ "saadparwaiz1/cmp_luasnip", requires = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" } }) -- luasnip completion support
	use({ "hrsh7th/cmp-nvim-lsp", requires = { "hrsh7th/nvim-cmp" } }) -- basic lsp cmp
	use({ "hrsh7th/cmp-buffer", requires = { "hrsh7th/nvim-cmp" } }) -- buffer words completion
	use({ "hrsh7th/cmp-path", requires = { "hrsh7th/nvim-cmp" } }) -- path completion
	use({ "hrsh7th/cmp-nvim-lua", requires = { "hrsh7th/nvim-cmp" } }) -- lua completion source
	use({ "onsails/lspkind-nvim", requires = { "hrsh7th/nvim-cmp" } }) -- lsp completion formatting
	use({ "f3fora/cmp-spell", requires = { "hrsh7th/nvim-cmp" } }) -- vim spell check
	use({ "petertriho/cmp-git", requires = { "hrsh7th/nvim-cmp", "nvim-lua/plenary.nvim" } }) -- vim spell check
end)
