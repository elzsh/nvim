return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			json = { "jq" },
			c = { "clang-format" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		},
		formatters = {
			jq = {
				prepend_args = { "--sort-keys", "--indent", "4" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
