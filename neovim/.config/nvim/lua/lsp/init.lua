local mod = {}
local config = require('lsp.config')
require("lsp.visuals")

-- cursor highlighting enable
local function documentHighlight(client, _)
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

local function custom_attach (client, bufnr)
	documentHighlight(client,bufnr)
    require("key_maps.lsp")
end

local function common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  return capabilities
end

local function common_on_init(client, _)

  local formatters = config[vim.bo.filetype].formatters
  if not vim.tbl_isempty(formatters) then
    client.resolved_capabilities.document_formatting = false
    -- u.lvim_log(string.format("Overriding [%s] formatter with [%s]", client.name, formatters[1].exe))
  end
end


local function setup(_, cfg)
    if not cfg then
        return
    end
    if type(cfg) ~= "table" then
        cfg={}
    end
  local lsp = cfg.lsp
  if lsp.provider ~= nil and lsp.provider ~= "" then
    local lspconfig = require "lspconfig"

    if not lsp.setup.on_attach then
      lsp.setup.on_attach = custom_attach
    end
    if not lsp.setup.on_init then
      lsp.setup.on_init = common_on_init
    end
    if not lsp.setup.capabilities then
      lsp.setup.capabilities = common_capabilities()
    end

    lspconfig[lsp.provider].setup(lsp.setup)
  end

end


for server, cfg in pairs(config) do
    setup(server,cfg)
end

return mod
