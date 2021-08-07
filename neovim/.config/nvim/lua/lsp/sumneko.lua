local m = {}

local sumneko_path = '/usr/bin/lua-language-server'
local lsp_config = require('lspconfig')

local function custom_init(client)
    client.resolved_capabilities.document_formatting = false
end

function m.setup()
    lsp_config.sumneko_lua.setup {
        on_attach = require("lsp").custom_attach,
        on_init = custom_init,
      cmd = {sumneko_path};
      settings = {
        Lua = {
          runtime = {
            -- tell the language server which version of lua you're using (most likely luajit in the case of neovim)
            version = 'luajit',
            -- setup your lua path
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            -- get the language server to recognize the `vim` global
            globals = {'vim', 'package', 'require'},
          },
          workspace = {
            -- make the server aware of neovim runtime files
            library = {
            [vim.fn.expand "~/.config/nvim/lua"] = true,
              [vim.fn.expand('$vimruntime/lua')] = true,
              [vim.fn.expand('$vimruntime/lua/vim/lsp')] = true,
            },
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    }
end

return m
