local cm = {}
local lsp_config = require'lspconfig'
local lsp = require('lsp')

function cm.setup()
    lsp_config.cmake.setup{
        on_attach = lsp.custom_attach,
        capabilities = lsp.common_capabilities(),
    }
end
return cm
