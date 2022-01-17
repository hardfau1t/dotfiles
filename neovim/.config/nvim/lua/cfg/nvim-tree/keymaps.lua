local avail, wk = pcall(require, "which-key")

if not avail then
	print("which key is required")
	return
end
wk.register({
    e = {
        name = "Explorer/NvimTree",
        t = {':NvimTreeToggle<CR>', "Toggle"},
        o = {':NvimTreeOpen<CR>', "Open"},
        f = {':NvimTreeFocus<CR>', "focus"},
        c = {':NvimTreeClose<CR>', "Close"},
        r = {':NvimTreeRefresh<CR>', "Refresh"},
    }
    },{ prefix = "<leader>"})
