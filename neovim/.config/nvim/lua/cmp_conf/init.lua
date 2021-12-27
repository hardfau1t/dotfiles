local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	preselect = cmp.PreselectMode.None,
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-j>"] = cmp.mapping.scroll_docs(-4),
		["<C-k>"] = cmp.mapping.scroll_docs(4),
		["<C-s>"] = cmp.mapping.complete({ config = { sources = { name = "luasnip" } } }),
		["<C-e>"] = cmp.mapping.close(),
	},

	sources = {
		{ name = "nvim_lsp", max_item_count = 16 },
		{ name = "nvim_lua" },
		{ name = "luasnip", max_item_count = 4 },
		{ name = "git" },
		{ name = "path" },
		{ name = "spell" },
		{ name = "buffer", keyword_length = 4 },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			symbol_map = {
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "ﰠ",
				Variable = "",
				Class = "ﴯ",
				Interface = "",
				Module = "",
				Property = "ﰠ",
				Unit = "塞",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "פּ",
				Event = "",
				Operator = "",
				TypeParameter = "",
			},
		}),
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})
