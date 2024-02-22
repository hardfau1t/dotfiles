local mod = {}
require("cfg.lsp.visuals")

-- cursor highlighting enable
local function documentHighlight(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = vim.api.nvim_create_augroup("DocumentHighlight", { clear = true }),
            desc = "Highlights the reference to given symbol",
            callback = function()
                vim.lsp.buf.document_highlight()
            end,
            buffer = bufnr,

        }
        )
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = vim.api.nvim_create_augroup("DocumentHighlightClear", { clear = true }),
            desc = "Clear highlighting",
            callback = function()
                vim.lsp.buf.clear_references()
            end,
            buffer = bufnr,
        })
    end
end

mod.default_attach = function(client, bufnr, config)
    -- enable document highlighting
    documentHighlight(client, bufnr)
    -- setup lsp keymap for given buffer
    require("cfg.lsp.keymaps").setup(bufnr)
    -- enable navbuddy and navic
    local nav_buddy_available, nav_buddy = pcall(require, "nvim-navbuddy")
    if nav_buddy_available and client.server_capabilities.documentSymbolProvider then
        nav_buddy.attach(client, bufnr)
    else
        vim.api.nvim_notify("nav_buddy is not installed or server has no documentSymbolProvider capabilities",
            vim.log.levels.WARN, {})
    end
    local navic_avail, navic = pcall(require, "nvim-navic")
    if navic_avail and client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    else
        vim.api.nvim_notify("navic is not installed or server has no capabilities", vim.log.levels.WARN, {})
    end
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
        if cfg.provider ~= nil and cfg.provider ~= "" then
            local setup = {}
            setup.on_attach = function(client, bufnr)
                if cfg.on_attach then
                    cfg.on_attach(client, bufnr)
                end
                mod.default_attach(client, bufnr)
            end
            setup.capabilities = vim.lsp.protocol.make_client_capabilities()
            if cmp_lsp_available then
                setup.capabilities = cmp_nvim_lsp.default_capabilities()
            end
            lspconfig[cfg.provider].setup(setup)
        end
    end
    local available, fidget = pcall(require, "fidget")
    if available then
        fidget.setup {}
    else
        vim.api.nvim_notify("fidget is not installed", vim.log.levels.WARN, {})
    end
end

return mod
