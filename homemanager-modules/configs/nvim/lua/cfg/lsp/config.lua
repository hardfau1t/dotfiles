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
            "vscode-json-languageserver",
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
    -- nix language server
    ["nil_ls"] = {
        settings = {
            ['nil'] = {
                formatting = {
                    command = { "nixfmt" },
                },
            }
        }
    },
    ["nushell"] = {},
    ["ruff"] = {
        on_attach = function(client, _bufnr)
            client.server_capabilities = vim.tbl_deep_extend('force', client.server_capabilities, {
                callHierarchyProvider = false,
                completionProvider = false,
                declarationProvider = false,
                definitionProvider = false,
                documentHighlightProvider = false,
                documentSymbolProvider = false,
                -- use hover from pyright, as it provides better results
                hoverProvider = false,
                referencesProvider = false,
                renameProvider = false,
                signatureHelpProvider = false,
                typeDefinitionProvider = false,
                workspaceSymbolProvider = false
            })
        end,
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
            settings = {
                logLevel = "debug",
            }
        }
    },
    ["pyright"] = {
        on_attach = function(client, _bufnr)
            client.server_capabilities = vim.tbl_deep_extend('force', client.server_capabilities, {
                codeActionProvider = false,
                diagnosticProvider = false,
                documentFormattingProvider = true,
                documentRangeFormattingProvider = true,
                executeCommandProvider = false,
                notebookDocumentSync = false,
            })
        end,
        settings = {
            pyright = {
                -- disableOrganizeImports = true, -- Using Ruff
            },
            python = {
                analysis = {
                    -- ignore = { '*' }, -- Using Ruff
                    -- typeCheckingMode = 'off', -- Using mypy
                },
            },
        },
    },
    ["rust_analyzer"] = {
        settings = {
            ["rust-analyzer"] = {},
        },
    },
    -- toml language server
    ["taplo"] = {},
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
