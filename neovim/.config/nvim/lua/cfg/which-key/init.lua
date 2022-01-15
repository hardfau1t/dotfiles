local M = {}
local config = {
    plugins = {
        spelling  = {
            enabled = true,
            suggestions = 10
        }
    },
    operators = {},
    window = {
        border = "single"
    }
}

M.setup = function ()
    local status, wk = pcall(require, "which-key")
    if not status then
        print("whch-key is not installed")
        return
    end
    wk.setup(config)
end

return M
