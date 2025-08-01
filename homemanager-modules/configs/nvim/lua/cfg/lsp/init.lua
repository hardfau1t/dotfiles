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


local function default_attach(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf
    -- enable document highlighting
    documentHighlight(client, bufnr)
    -- setup lsp keymap for given buffer
    print("keymaps are configured")
    require("cfg.lsp.keymaps").setup(bufnr)
    -- enable navbuddy and navic
    if client.server_capabilities.documentSymbolProvider then
        if nav_buddy_available then
            nav_buddy.attach(client, bufnr)
        else
            vim.notify("nav_buddy is not installed or server has no documentSymbolProvider capabilities",
                vim.log.levels.WARN)
        end
        if navic_avail then
            navic.attach(client, bufnr)
        else
            vim.notify("navic is not installed or server has no capabilities", vim.log.levels.WARN, {})
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
    local lsp_configs = require("cfg.lsp.config")

    -- progress widget
    local fidget_available, fidget = pcall(require, "fidget")
    if fidget_available then
        fidget.setup({})
    end

    local cmp_lsp_available, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    require("vim.lsp.log").set_level(vim.log.levels.WARN)

    for provider, config in pairs(lsp_configs) do

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- enable cmp capabilities
        if cmp_lsp_available then
            capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
        end

        config.capabilities = capabilities
        vim.lsp.config(provider, config)
    end
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup('lsp.attach', {}),
      callback = default_attach
    })
end

return mod
