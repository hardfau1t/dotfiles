do
    local level = vim.log.levels
    local status, ls = pcall(require, "luasnip")
    if not status then
        vim.notify("luasnip is not installed", level.WARN)
        return
    end
    local types = require("luasnip.util.types")
    ls.config.set_config {
        history = true
    }
    require("luasnip.loaders.from_vscode").lazy_load()
end
