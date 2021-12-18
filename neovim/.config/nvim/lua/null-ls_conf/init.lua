local nls = require("null-ls")
local sources = {
	nls.builtins.formatting.clang_format,
	nls.builtins.formatting.stylua,
}
nls.setup({ sources = sources })
