function _G.p(...)
    print(vim.inspect(...))
    return ...
end

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
