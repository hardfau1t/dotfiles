local mod = {}

mod.setup = function(client, bufnr)
    vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = bufnr, silent = true, desc = "open lsp signature_help"})
    vim.keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = bufnr, silent = true, desc = "go to declaration"})
    vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, silent = true, desc = "go to definition"})
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr, silent = true, desc = "list all references"})
    vim.keymap.set('n', "<leader>lwa", function() vim.lsp.buf.add_workspace_folder() end, { buffer = bufnr, desc = "add workspace folder"})
    vim.keymap.set('n', "<leader>lwr", function() vim.lsp.buf.remove_workspace_folder() end, { buffer = bufnr, desc = "remove workspace folder"})
    vim.keymap.set('n', "<leader>lwl",
        function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { buffer = bufnr, desc = "list all workspace folders"})
    vim.keymap.set('n', "<leader>lp", function() require 'cfg.lsp.utils'.PeekDefinition() end, { buffer = bufnr, desc = "peek definition"})
    vim.keymap.set('n', "<leader>lh", function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = "show hover information"})
    vim.keymap.set('n', "<leader>ls", function() vim.lsp.buf.signature_help() end, { buffer = bufnr, desc = "show signature help"})
    vim.keymap.set('n', "<leader>lr", function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "rename variable"})
    vim.keymap.set('n', "<leader>la", function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = "show available actions"})
    vim.keymap.set('n', "<leader>lt", function() vim.lsp.buf.type_definition() end, { buffer = bufnr, desc = "show type definition"})
    vim.keymap.set({'n', 'v'}, "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { buffer = bufnr, desc = "format section/whole file"})
    vim.keymap.set('n', "<leader>lT", "<cmd>LspStop<CR>", { buffer = bufnr, desc = "stop lsp server"})
    vim.keymap.set('n', "<leader>li", "<cmd>LspInfo<CR>", { buffer = bufnr, desc = "start lsp server"})
    vim.keymap.set('n', "<leader>lR", "<cmd>LspRestart<CR>", { buffer = bufnr, desc = "restart lsp server"})
    -- diagnostic keymaps
    vim.keymap.set('n', "<leader>do", vim.diagnostic.open_float, { buffer = bufnr , desc = "open diagnostic message in floating window"})
    vim.keymap.set('n', "<leader>dp", vim.diagnostic.goto_prev, { buffer = bufnr , desc = "previous diagnostics"})
    vim.keymap.set('n', "<leader>dn", vim.diagnostic.goto_next, { buffer = bufnr , desc = "next diagnostics"})
    vim.keymap.set('n', "<leader>ds", vim.diagnostic.show, { buffer = bufnr , desc = "show all diagnostic errors"})
    vim.keymap.set('n', "<leader>dh", vim.diagnostic.hide, { buffer = bufnr , desc = "hide all diagnostic errors"})
    vim.keymap.set('n', "<leader>dd", vim.diagnostic.disable, { buffer = bufnr , desc = "disable lsp diagnostics"})
    vim.keymap.set('n', "<leader>de", vim.diagnostic.enable, { buffer = bufnr, desc = "enable lsp diagnostics"})
    vim.keymap.set('n', "<leader>dq", vim.diagnostic.toqflist, { buffer = bufnr , desc = "move diagnostics to quickfixlist"})
    vim.keymap.set('n', "<leader>dr", vim.diagnostic.reset, { buffer = bufnr , desc = "move diagnostics to quickfixlist"})

    local nav_buddy_available, navbuddy = pcall(require, "nvim-navbuddy")
    if nav_buddy_available then
        vim.keymap.set('n', "<leader>n", navbuddy.open, {buffer = bufnr, desc = "open nav_buddy"})
    end
end
return mod
