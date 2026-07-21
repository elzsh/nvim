return {
	"mason-org/mason.nvim",
	opts = {
		max_concurrent_installers = 4,
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
