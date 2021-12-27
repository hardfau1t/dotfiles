local mod = {}

function mod.setup()
	local req_stat, rt = pcall(require, "rust-tools")

	if not req_stat then
		print("rust tools not found")
		return
	end
	local opts = {
		crate_graph = {
			backend = "gtk",
		},
	}
	rt.setup(opts)
end

return mod
