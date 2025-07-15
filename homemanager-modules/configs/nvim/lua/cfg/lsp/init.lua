local mod = {}
require("cfg.lsp.visuals")
local nav_buddy_available, nav_buddy = pcall(require, "nvim-navbuddy")
local navic_avail, navic = pcall(require, "nvim-navic")

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


-- local function external_format(formatter, bufnr)
--     local cmd = formatter.exe ..
--         ' ' .. (table.concat(formatter.args, ' ')) .. " " .. vim.api.nvim_buf_get_name(bufnr) .. " 2> /dev/null"
--     if vim.bo.modified then
--         vim.cmd.write("%")
--         log.warn("file saved for formatting")
--     end
--     os.execute(cmd)
-- end

local function default_attach(client, bufnr)
    -- enable document highlighting
    documentHighlight(client, bufnr)
    -- setup lsp keymap for given buffer
    require("cfg.lsp.keymaps").setup(bufnr)
    -- enable navbuddy and navic
    if client.server_capabilities.documentSymbolProvider then
        if nav_buddy_available then
            nav_buddy.attach(client, bufnr)
        else
            vim.api.nvim_notify("nav_buddy is not installed or server has no documentSymbolProvider capabilities",
                vim.log.levels.WARN, {})
        end
        if navic_avail then
            navic.attach(client, bufnr)
        else
            vim.api.nvim_notify("navic is not installed or server has no capabilities", vim.log.levels.WARN, {})
        end
    end

    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end


mod.setup = function()
    vim.fn.sign_define({
        { name = 'DiagnosticSignError', text = '', texthl = "DiagnosticError" },
        { name = 'DiagnosticSignWarn', text = '', texthl = "DiagnosticWarn" },
        { name = 'DiagnosticSignInfo', text = '!', texthl = "DiagnosticInfo" },
        { name = 'DiagnosticSignHint', text = '', texthl = "DiagnosticHint" },
    })
    local severity = vim.diagnostic.severity
    -- setup diagnostics
    vim.diagnostic.config({
        virtual_text     = {
            virt_text_hide = true,
            severity = { severity.WARN, severity.ERROR },
            prefix = "[",
            suffix = " ]",
        },
        update_in_insert = false,
        underline        = { severity = { severity.WARN, severity.ERROR } },
        severity_sort    = true,
    })
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
    -- progress widget
    local fidget_available, fidget = pcall(require, "fidget")
    if fidget_available then
        fidget.setup({})
    end
    local cmp_lsp_available, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    require("vim.lsp.log").set_level(vim.log.levels.WARN)
    for provider, setup in pairs(config) do
        local provider_attach = setup.on_attach

        setup.on_attach = function(client, bufnr)
            default_attach(client, bufnr)
            if provider_attach then
                provider_attach(client, bufnr)
            end
        end

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- enable cmp capabilities
        if cmp_lsp_available then
            capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
        end

        setup.capabilities = capabilities
        lspconfig[provider].setup(setup)
    end
    -- new format of lsp setup 
    vim.lsp.enable("vhdl_ls")
end

return mod
