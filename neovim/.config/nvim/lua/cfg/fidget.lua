
do
    local status,fidget = pcall(require, "fidget")
    if status then
        fidget.setup()
    else
        vim.notify("fidget is not installed")
    end
end
