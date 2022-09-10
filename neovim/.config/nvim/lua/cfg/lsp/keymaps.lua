local mod = {}
local buf_keymap = vim.api.nvim_buf_set_keymap

mod.setup = function(bufn)
    local opts = { noremap = true, silent = true }
    local avail, wk = pcall(require, "which-key")
    if not avail then
        print("which key is required")
        return
    end
    buf_keymap(bufn, "i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_keymap(bufn, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_keymap(bufn, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_keymap(bufn, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_keymap(bufn, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    wk.register({
        l = {
            name = "Lsp",
            w = {
                name = "workspace actions",
                a = { function () vim.lsp.buf.add_workspace_folder() end, "add folder" },
                r = { function () vim.lsp.buf.remove_workspace_folder() end, "remove folder" },
                l = {
                    function () print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
                    "list folders",
                },
            },
            p = { function () require'lsp.utils'.PeekDefinition() end, "peak definition" },
            h = { function () vim.lsp.buf.hover() end, "hover" },
            s = { function () vim.lsp.buf.signature_help() end, "signature" },
            r = { function () vim.lsp.buf.rename() end, "Rename" },
            a = { function () vim.lsp.buf.code_action() end, "Code actions" },
            t = { function () vim.lsp.buf.type_definition() end, "type definition" },
            f = { function() vim.lsp.buf.format({async = true})end, "format" },
            T = { "<cmd>LspStop<CR>", "Stop" },
            i = { "<cmd>LspInfo<CR>", "Info" },
            R = { "<cmd>LspRestart<CR>", "Restart" },
        },
        d = {
            name = "diagnostics",
            o = { function () vim.diagnostic.open_float() end, "open" },
            p = { function () vim.diagnostic.goto_prev() end, "previous" },
            n = { function () vim.diagnostic.goto_next() end, "next" },
            s = { function () vim.diagnostic.show() end, "show" },
            h = { function () vim.diagnostic.hide() end, "hide" },
            d = { function () vim.diagnostic.disable() end, "disable" },
            e = { function () vim.diagnostic.enable() end, "enable" },
            q = { function () vim.diagnostic.toqflist() end, "to quickfix list" },
        },
    }, { prefix = "<leader>", buffer = bufn })
end
return mod
