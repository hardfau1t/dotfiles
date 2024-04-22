do
    local opts = {}
    local status, mod = pcall(require, "which-key")
    if status then
        mod.setup(opts)
    else
        vim.notify("which key is not installed", vim.log.levels.WARN)
    end
end
