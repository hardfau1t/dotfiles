local function setup(neogen)
    neogen.setup({ snippet_engine = "luasnip" })
    vim.keymap.set("n", "<leader>ls", neogen.generate, {desc="generate signatures"})
    vim.keymap.set("i", "<c-s>", neogen.generate, {desc="generate signatures"})
end

do
    local status, neogen = pcall(require, "neogen")
    if status then
        setup(neogen)
    else
        vim.notify("neogen is not installed", vim.log.levels.WARN)
    end
end
