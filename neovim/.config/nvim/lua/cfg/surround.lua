local opts = {}

do
    local status, surround = pcall(require, "neogit")
    if status then
        surround.setup(opts)
    else
        vim.notify("Neogit is not installed", vim.log.levels.WARN)
    end
end
