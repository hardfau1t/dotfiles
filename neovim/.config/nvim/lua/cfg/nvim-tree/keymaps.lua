local avail, wk = pcall(require, "which-key")

if not avail then
    print("which key is required")
    return
end
wk.register({
    e = {
        ':NvimTreeToggle<CR>', "Explorer/NvimTree"
    }
}, { prefix = "<leader>" })
