do
    local status, hl = pcall(require, 'nvim-highlight-colors')
    if status then
        hl.setup()
    else
        vim.notify("nvim-highligtht-colors not found", vim.log.levels.WARN)
    end
end
