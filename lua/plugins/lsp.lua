return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		automatic_enable = {
			exclude = { "stylua" },
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	init = function()
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					workspace = {
						library = { vim.env.VIMRUNTIME },
					},
				},
			},
		})
	end,
}
