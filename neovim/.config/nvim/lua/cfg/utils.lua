-- removes all the unused buffers
function _G.clean_buf()
    for _, v in pairs(vim.fn.getbufinfo()) do
        if v.hidden ~= 0 and v.listed == 1 then
            if v.changed == 0 then
                vim.api.nvim_buf_delete(v.bufnr, {})
                vim.notify("Buffer wiped: ".. v.name, vim.log.levels.INFO)
            else
                vim.notify("Skipped UnWritten Buffer : ".. v.name, vim.log.levels.WARN)
            end
        end
    end
end

_G.log = {
    debug = function(msg)
        vim.notify(msg, vim.log.levels.DEBUG, {})
    end,
    info = function(msg)
        vim.notify(msg, vim.log.levels.INFO, {})
    end,
    warn = function(msg)
        vim.notify(msg, vim.log.levels.WARN, {})
    end,
    error = function(msg)
        vim.notify(msg, vim.log.levels.ERROR, {})
    end,
}
