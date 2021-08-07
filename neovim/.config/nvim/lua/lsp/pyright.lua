local M = {}
local lsp_config = require('lspconfig')
function M.setup()
    lsp_config.jedi_language_server.setup{
        cmd = {
            "/usr/bin/pyright-langserver",
            "--stdio",
        },
        on_attach = require('lsp').custom_attach
    }
end

return M
