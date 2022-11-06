local fn = vim.fn
-- install packer if its not installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"


local fresh_inst = false
if fn.empty(fn.glob(install_path)) > 0 then
    print("installing packer")
    fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.cmd("packadd packer.nvim") -- add the packer to vim
    fresh_inst = true
end


local status, packer = pcall(require, "packer")
if not status then
    print("Failed to load packer ")
    return
end

if fresh_inst then
    packer.sync()
end
-- better to reset when re sourcing
packer.reset()
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

local plugins = require("cfg.packer.plugins")

packer.startup(plugins.plugins)
-- auto load packer file if its written
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("WriteSync", { clear = true }),
    pattern = { "*plugins.lua" },
    command = 'source <afile> | PackerSync '
})

vim.api.nvim_create_autocmd("BufWritePost", {
    -- 2 groups should have different name otherwise first group will be overwritten
    group = vim.api.nvim_create_augroup("WriteCompile", { clear = true }),
    pattern = { "*/.config/nvim/*" },
    command = 'source <afile> | PackerCompile'
})
