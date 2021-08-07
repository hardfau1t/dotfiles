local clang = {}
local lsp_config = require'lspconfig'
local lsp = require('lsp')

local format_opt = "'{IndentWidth: 4}'"

function clang.setup()
    lsp_config.clangd.setup{
        cmd = {"/usr/bin/clangd",
                  "--background-index",
          "--header-insertion=never",
          "--cross-file-rename",
          "--clang-tidy",
      },
        on_attach = lsp.custom_attach,
        capabilities = lsp.common_capabilities(),
    }
end
return clang
