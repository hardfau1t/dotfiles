local M={}

local lsp_config = require('lspconfig')

function M.setup()
    lsp_config.rust_analyzer.setup{
        on_attach=require('lsp').custom_attach,
        cmd = { "/home/gireesh/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin/rust-analyzer" };
        filetypes = { "rust" };
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importMergeBehavior = "last",
                    importPrefix = "by_self",
                },
                cargo = {
                    loadOutDirsFromCheck = true,
                    -- features = {"stm32f767", "device-selected"},
                    -- target = {"thumbv7em-none-eabihf"}
                },
                procMacro = {
                    enable = true
                },
            }
        }
    }
end

return M
