return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"bashls",
			"clangd",
			"basedpyright",
		},

		automatic_enable = true,
	},
}
