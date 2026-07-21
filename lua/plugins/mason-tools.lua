return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		ensure_installed = {
			"stylua",
			"shfmt",
			"shellcheck",
			"clang-format",
			"prettierd",
			"tree-sitter-cli",
		},
		auto_update = false,
		run_on_start = true,
		start_delay = 3000,
		debounce_hours = 24,
	},
}
