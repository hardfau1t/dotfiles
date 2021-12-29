local mod = {}
function mod.init()
	--------------------------------------------------------
	-- treesitter dependencies must called before setup
	local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

	parser_configs.norg = {
		install_info = {
			url = "https://github.com/nvim-neorg/tree-sitter-norg",
			files = { "src/parser.c", "src/scanner.cc" },
			branch = "main",
		},
	}

	parser_configs.norg_meta = {
		install_info = {
			url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
			files = { "src/parser.c" },
			branch = "main",
		},
	}

	parser_configs.norg_table = {
		install_info = {
			url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
			files = { "src/parser.c" },
			branch = "main",
		},
	}

	--------------------------------------------------------

	local opts = {
		load = {
			["core.defaults"] = {}, -- Load all the default modules
			["core.norg.concealer"] = {}, -- Allows for use of icons
			["core.norg.journal"] = {},
			["core.gtd.base"] = {},
			["core.norg.dirman"] = { -- Manage your directories with Neorg
				config = {
					workspaces = {
						my_workspace = "~/.local/share/neorg",
					},
				},
			},
			["core.norg.completion"] = {
				config = {
					engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
				},
			},
		},
	}

	require("neorg").setup(opts)
	require("cfg.neorg.keymaps")
end

return mod
