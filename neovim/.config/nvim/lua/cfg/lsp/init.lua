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


local function external_format (formatter, bufnr)
    local cmd = formatter.exe.. ' ' .. (table.concat(formatter.args, ' ')) .. " " .. vim.api.nvim_buf_get_name(bufnr) .. " 2> /dev/null"
    if vim.bo.modified then
        vim.cmd.write("%")
        log.warn("file saved for formatting")
    end
    os.execute(cmd)
end

local function default_attach (client, bufnr, formatter)
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

    if not (client.server_capabilities.documentFormattingProvider or formatter == nil or formatter.exe == nil) then
        vim.keymap.set("n", "<leader>lf", function () external_format(formatter, bufnr) end, {buffer = bufnr, desc = "format with "..formatter.exe})
    end
    vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
end


do
    vim.fn.sign_define({
        {name = 'DiagnosticSignError', text='', texthl = "DiagnosticError" },
        {name = 'DiagnosticSignWarn', text='', texthl = "DiagnosticWarn" },
        {name = 'DiagnosticSignInfo', text='!', texthl = "DiagnosticInfo" },
        {name = 'DiagnosticSignHint', text='', texthl = "DiagnosticHint" },
    })
    local severity = vim.diagnostic.severity
    -- setup diagnostics
    vim.diagnostic.config({
        virtual_text = {
            virt_text_hide = true,
            severity = {severity.WARN, severity.ERROR},
            prefix = "[",
            suffix = " ]",
        },
        update_in_insert  = false,
        underline = { severity = {severity.WARN, severity.ERROR }},
        severity_sort = true,
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
    local cmp_lsp_available, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    require("vim.lsp.log").set_level(vim.log.levels.INFO)
    for _, cfg in pairs(config) do
        if cfg.provider ~= nil and cfg.provider ~= "" then
            local setup = {}
            setup.on_attach = function(client, bufnr)
                if cfg.on_attach then
                    cfg.on_attach(client, bufnr)
                end
                default_attach(client, bufnr, cfg.formatter)
            end
            -- if cfg.on_init then
            --     setup.on_init = cfg.on_init
            -- end
            setup.capabilities = vim.lsp.protocol.make_client_capabilities()
            setup.settings = cfg.settings
            if cmp_lsp_available then
                setup.capabilities = cmp_nvim_lsp.default_capabilities()
            end
            lspconfig[cfg.provider].setup(setup)
        end
    end
end

