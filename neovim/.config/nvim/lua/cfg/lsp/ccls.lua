local M = {}

function M.setup()
    require'lspconfig'.ccls.setup{
        cmd = {"/usr/bin/ccls"},
    }
end

return M
