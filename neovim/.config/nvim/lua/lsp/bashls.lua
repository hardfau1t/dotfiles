local M = {}
local lsp_config = require('lspconfig')
function M.setup()
    lsp_config.bashls.setup{
        on_attach = require('lsp').custom_attach,
        cmd =  { "bash-language-server", "start"},
    }
end

return M
