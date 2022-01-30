local schemas = nil
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
	schemas = jsonls_settings.get_default_schemas()
end

local cfg = {
	c = {
		formatters = {
			-- {
			--   exe = "clang_format",
			--   args = {},
			-- },
			-- {
			--   exe = "uncrustify",
			--   args = {},
			-- },
		},
		linters = {},
		lsp = {
			provider = "clangd",
			setup = {
				cmd = {
					"clangd",
					"--background-index",
					"--header-insertion=never",
					"--cross-file-rename",
					"--clang-tidy",
					"--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
				},
			},
		},
	},
	cmake = {
		formatters = {
			{
				exe = "cmake-format",
				args = {},
			},
		},
		linters = {},
		lsp = {
			provider = "cmake",
			setup = {
				cmd = {
					"cmake-language-server",
				},
			},
		},
	},
	html = {
		formatters = {
			exe = "prettier",
			args = { "-w", "--print-width 100" },
		},
	},
	css = {
		formatters = {
			{
				exe = "prettier",
				args = { "-w", "--print-width 100" },
			},
		},
		linters = {},
		lsp = {
			provider = "cssls",
			setup = {
				cmd = {
					"node",
					"/usr/lib/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server",
					"--stdio",
				},
			},
		},
	},
	json = {
		formatters = {
			-- {
			--   exe = "json_tool",
			--   args = {},
			-- },
			-- {
			--   exe = "prettier",
			--   args = {},
			-- },
			-- {
			--   exe = "prettierd",
			--   args = {},
			-- },
		},
		linters = {},
		lsp = {
			provider = "jsonls",
			setup = {
				cmd = {
					"node",
					"/usr/lib/node_modules/vscode-langservers-extracted/bin/vscode-json-language-server",
					"--stdio",
				},
				settings = {
					json = {
						schemas = schemas,
						--   = {
						--   {
						--     fileMatch = { "package.json" },
						--     url = "https://json.schemastore.org/package.json",
						--   },
						-- },
					},
				},
				commands = {
					Format = {
						function()
							vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
						end,
					},
				},
			},
		},
	},
	lua = {
		formatters = {
			{
				exe = "stylua",
				args = {},
			},
		},
		linters = {},
		lsp = {
			provider = "sumneko_lua",
			setup = {
				cmd = {
					"lua-language-server",
				},
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
							path = vim.split(package.path, ";"),
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim", "package", "require", "use" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = {
								[vim.fn.expand("~/.config/nvim/lua")] = true,
								[vim.fn.expand("$vimruntime/lua")] = true,
								[vim.fn.expand("$vimruntime/lua/vim/lsp")] = true,
							},
							maxPreload = 100000,
							preloadFileSize = 1000,
						},
					},
				},
			},
		},
	},
	python = {
		formatters = {
			-- {
			--   exe = "yapf",
			--   args = {},
			-- },
			-- {
			--   exe = "isort",
			--   args = {},
			-- },
		},
		linters = {},
		lsp = {
			provider = "jedi_language_server",
			setup = {
				cmd = {
					"jedi-language-server",
				},
			},
		},
	},
-- 	rust = {
-- 		formatters = {},
-- 		linters = {},
-- 		lsp = {
-- 			provider = "rust_analyzer",
-- 			setup = {
-- 				filetypes = { "rust" },
-- 				cmd = {
-- 					vim.fn.expand("~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer"),
-- 				},
-- 				settings = {
-- 					["rust-analyzer"] = {
-- 						assist = {
-- 							importMergeBehavior = "last",
-- 							importPrefix = "by_self",
-- 						},
-- 						cargo = {
-- 							loadOutDirsFromCheck = true,
-- 							-- features = {"stm32f767", "device-selected"},
-- 							-- target = {"thumbv7em-none-eabihf"}
-- 						},
-- 						checkOnSave = {
-- 							command = "clippy",
-- 						},
-- 						completion = {
-- 							autoimport = {
-- 								enable = true,
-- 							},
-- 						},
--                         rustfmt = {
--                             extraArgs = {"--config", "tab_spaces=2"}
--                         },
-- 						inlay_hints = {
-- 							only_current_line = false,
-- 							only_current_line_autocmd = "CursorHold",
-- 							show_parameter_hints = true,
-- 							parameter_hints_prefix = "<- ",
-- 							other_hints_prefix = "=> ",
-- 							max_len_align = false,
-- 							max_len_align_padding = 1,
-- 							right_align = false,
-- 							right_align_padding = 7,
-- 							highlight = "Comment",
-- 						},
-- 						procMacro = {
-- 							enable = true,
-- 						},
-- 					},
-- 				},
-- 			},
-- 		},
-- 	},
	sh = {
		formatters = {
			-- {
			--   exe = "shfmt",
			--   args = {},
			-- },
		},
		linters = {},
		lsp = {
			provider = "bashls",
			setup = {
				cmd = {
					"bash-language-server",
					"start",
				},
			},
		},
	},
	yaml = {
		formatters = {
			-- {
			--   exe = "prettier",
			--   args = {},
			-- },
			-- {
			--   exe = "prettierd",
			--   args = {},
			-- },
		},
		linters = {},
		lsp = {
			provider = "yamlls",
			setup = {
				cmd = {
					"/usr/bin/yaml-language-server",
					"--stdio",
				},
			},
		},
	},
}

return cfg
