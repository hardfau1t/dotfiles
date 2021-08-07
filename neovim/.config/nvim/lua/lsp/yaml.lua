local yml = {}
local lsp_config = require'lspconfig'
local lsp = require('lsp')

function yml.setup()
    lsp_config.yamlls.setup{
        cmd = {
            "/usr/bin/yaml-language-server",
            "--stdio",
        },
        on_attach = lsp.custom_attach,
        capabilities = lsp.common_capabilities(),
    }
end
return yml
