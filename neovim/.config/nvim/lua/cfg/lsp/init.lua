local mod = {}
require("cfg.lsp.visuals")

-- cursor highlighting enable
local function documentHighlight(client, _)
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = vim.api.nvim_create_augroup("DocumentHighlight", { clear = true }),
            desc = "Highlights the reference to given symbol",
            callback = function()
                vim.lsp.buf.document_highlight()
            end
        }
        )
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = vim.api.nvim_create_augroup("DocumentHighlightClear", { clear = true }),
            desc = "Clear highlighting",
            callback = function()
                vim.lsp.buf.clear_references()
            end
        }
        )
    end
end

mod.custom_attach = function(client, bufnr)
    -- print("stop", vim.inspect(client.stop))
    -- print("name", vim.inspect(client.name))
    -- print("notify", vim.inspect(client.notify))
    -- print("initialized", vim.inspect(client.initialized))
    -- print("handlers", vim.inspect(client.handlers))
    -- print("is_stopped", vim.inspect(client.is_stopped))
    -- print("requests", vim.inspect(client.requests))
    -- print("id", vim.inspect(client.id))
    print("server_capabilities", vim.inspect(client.server_capabilities))
    -- print("workspace_folders", vim.inspect(client.workspace_folders))
    -- print("rpc", vim.inspect(client.rpc))
    -- print("_on_attach", vim.inspect(client._on_attach))
    -- print("offset_encoding", vim.inspect(client.offset_encoding))
    -- print("request_sync", vim.inspect(client.request_sync))
    -- print("supports_method", vim.inspect(client.supports_method))
    -- print("attached_buffers", vim.inspect(client.attached_buffers))
    -- print("workspaceFolders", vim.inspect(client.workspaceFolders))
    -- print("commands", vim.inspect(client.commands))
    -- print("workspace_did_change_configuration", vim.inspect(client.workspace_did_change_configuration))
    -- print("messages", vim.inspect(client.messages))
    -- print("request", vim.inspect(client.request))
    -- print("cancel_request", vim.inspect(client.cancel_request))
    -- print("config", vim.inspect(client.config))
    documentHighlight(client, bufnr)
    require("cfg.lsp.keymaps").setup(bufnr)
end

mod.setup = function()
    local config = require("cfg.lsp.config")
    if config == nil then
        print("lsp cfg table not found")
        return
    end
    local lspconfig_available, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_available then
        print("lspconfig module not found")
        return
    end
    local cmp_lsp_available, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    require("vim.lsp.log").set_level(vim.log.levels.ERROR)
    for _, cfg in pairs(config) do
        local lsp = cfg.lsp
        if lsp ~= nil and lsp.provider ~= nil and lsp.provider ~= "" then
            lsp.setup.on_attach = mod.custom_attach
            lsp.setup.capabilities = vim.lsp.protocol.make_client_capabilities()
            if cmp_lsp_available then
                lsp.setup.capabilities = cmp_nvim_lsp.default_capabilities()
            end
            lspconfig[lsp.provider].setup(lsp.setup)
        end
    end
end

return mod
