local fn = vim.fn
-- other configs
require("config")
require("colorscheme")
require("utils")
require("key_maps")
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
		autocmd BufWritePost ]] .. vim.fn.stdpath("config") .. [[/lua/plugins/init.lua source <afile> | PackerSync
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
	use({
        "yuttie/comfortable-motion.vim",
        config = function()
            require("easy_motion_conf")
        end
    })
	use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("treesitter_conf")
        end
})
	use("vimwiki/vimwiki")
	use("morhetz/gruvbox")
	use("rebelot/kanagawa.nvim")
	use({
        "tpope/vim-fugitive",
        config = function ()
            require("fugitive_conf")
        end
    })
	use({
        "preservim/nerdcommenter",
        config = function ()
            require("nerdcommenter_conf")
        end
    })
	use("folke/tokyonight.nvim")
	use("mhartington/formatter.nvim") -- formatter
	use("itchyny/calendar.vim")
	use({ -- diagnostics looks cool
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"neovim/nvim-lspconfig",
		requires = { { "jose-elias-alvarez/null-ls.nvim", opt = true } },
        config = function ()
            require("lsp")
        end
	})

    use({
        "simrat39/rust-tools.nvim",
        requires = { "neovim/nvim-lspconfig" },
        config = function()
            require("rust_tools_cfg").setup()
        end,
    })

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-tree_conf")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			require("telescope_conf")
		end,
	})
	use({
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({
				-- Tell Neorg what modules to load
				load = {
					["core.defaults"] = {}, -- Load all the default modules
					["core.norg.concealer"] = {}, -- Allows for use of icons
					["core.norg.dirman"] = { -- Manage your directories with Neorg
						config = {
							workspaces = {
								my_workspace = "~/neorg",
							},
						},
					},
				},
			})
		end,
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function ()
            require("lua_line_conf")
        end
	})
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	-- nvim cmp plugin and sources
	use({
		"hrsh7th/nvim-cmp",
		requires = { "neovim/nvim-lspconfig", { "nvim-lua/lsp_extensions.nvim", opt = true } },
        config = function ()
            require("cmp_conf")
        end
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

