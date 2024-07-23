local schemas = nil
local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
if status_ok then
    schemas = jsonls_settings.get_default_schemas()
end
local cfg = {
    ["arduino_language_server"] = {
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
    ["clangd"] = {
        cmd = {
            "clangd",
            "--background-index",
            "--header-insertion=never",
            "--cross-file-rename",
            "--clang-tidy",
            "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*",
        },
    },
    ["cmake"] = {
        cmd = {
            "cmake-language-server",
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
    ["jsonls"] = {
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
    ["lua_ls"] = {
        on_attach = function(client, init_result)
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
    ["nushell"] = {
    },
    ["ruff"] = {
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
            settings = {
                logLevel = "debug",
            }
        }
    },
    ["pyright"] = {
        settings = {
            pyright = {
                disableOrganizeImports = true, -- Using Ruff
            },
            python = {
                analysis = {
                    ignore = { '*' }, -- Using Ruff
                    typeCheckingMode = 'off', -- Using mypy
                },
            },
        },
    },
    ["rust_analyzer"] = {
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
    ["bashls"] = {
        cmd = {
            "bash-language-server",
            "start",
        },
    },
    ["yamlls"] = {
        cmd = {
            "/usr/bin/yaml-language-server",
            "--stdio",
        },
    },
    ["denols"] = {
        cmd = {
            "deno",
            "lsp"
        }
    },
    ["zls"] = {
        cmd = { "zls" },
    }
}

return cfg
