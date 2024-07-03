local schemas = nil
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
    schemas = jsonls_settings.get_default_schemas()
end
local cfg = {
    arduino = {
        formatter = {},
        provider = "arduino_language_server",
        setup = {
            cmd = {
                "arduino-language-server",
                "-cli-config",
                vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
                "-fqbn",
                "arduino:avr:nano:cpu=atmega328old",
                "-cli-daemon-addr",
                "localhost",
                "-cli-daemon-instance",
                "1",
                "-clangd",
                "/usr/bin/clangd",
            },
        },
    },
    c = {
        formatter = {
            --   exe = "clang_format",
            --   args = {},
        },
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
    cmake = {
        formatter = {
            exe = "cmake-format",
            args = {},
        },
        provider = "cmake",
        setup = {
            cmd = {
                "cmake-language-server",
            },
        },
    },
    -- html = {
    --  formatter = {
    --   exe = "prettier",
    --   args = { "-w", "--print-width 100" },
    --  },
    -- },
    -- css = {
    --  formatter = {
    --    exe = "prettier",
    --    args = { "-w", "--print-width 100" },
    --  },
    --   provider = "cssls",
    --   setup = {
    --    cmd = {
    --     "node",
    --     "/usr/lib/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server",
    --     "--stdio",
    --    },
    --   },
    -- },
    json = {
        formatter = {},
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
    lua = {
        formatter = {
            exe = "stylua",
            args = {},
        },
        provider = "lua_ls",
        on_init = function(client, init_result)
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                return
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                    }
                }
            })
        end,
        setup = {
            cmd = {
                "lua-language-server",
            },
            settings = {
                -- Lua = {
                hint = { enable = true },
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
                -- },
            },
        },
    },
    nushell = {
        formatter = {},
        provider = "nushell",
    },
    python = {
        provider = "pylsp",
        settings = {}
    },
    rust = {
        formatter = {},
        provider = "rust_analyzer",
        setup = {
            filetypes = { "rust" },
            cmd = { "rustup", "run", "stable", "rust-analyzer" },
            settings = {
                ["rust-analyzer"] = {
                    imports = {
                        granularity = {
                            group = "crate"
                        },
                        prefix = "crate",
                    },
                    cargo = {
                        loadOutDirsFromCheck = true,
                        -- features = {"stm32f767", "device-selected"},
                        -- target = {"thumbv7em-none-eabihf"}
                    },
                    checkOnSave = {
                        command = "clippy",
                    },
                    completion = {
                        autoimport = {
                            enable = true,
                        },
                    },
                    inlay_hints = {
                        only_current_line = false,
                        only_current_line_autocmd = "CursorHold",
                        show_parameter_hints = true,
                        parameter_hints_prefix = "<- ",
                        other_hints_prefix = "=> ",
                        max_len_align = false,
                        max_len_align_padding = 1,
                        right_align = false,
                        right_align_padding = 7,
                        highlight = "Comment",
                    },
                    procMacro = {
                        enable = true,
                    },
                },
            },
        },
    },
    sh = {
        formatter = {
            --   exe = "shfmt",
            --   args = {},
        },
        provider = "bashls",
        setup = {
            cmd = {
                "bash-language-server",
                "start",
            },
        },
    },
    yaml = {
        formatter = {
            --   exe = "prettier",
            --   args = {},
        },
        provider = "yamlls",
        setup = {
            cmd = {
                "/usr/bin/yaml-language-server",
                "--stdio",
            },
        },
    },
    javascript = {
        provider = "denols",
        setup = {
            cmd = {
                "deno",
                "lsp"
            }
        }
    },
    zig = {
        provider = "zls",
        setup = {
            cmd = { "zls" },
        }
    }
}

return cfg
