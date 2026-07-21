local function prettier()
	return { "prettierd", "prettier", stop_after_first = true }
end

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({
					async = true,
					lsp_format = "fallback",
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or selection",
		},
	},
	opts = {
		formatters_by_ft = {
			svelte = prettier(),
			javascript = prettier(),
			typescript = prettier(),
			html = prettier(),
			css = prettier(),
			scss = prettier(),
			json = prettier(),
			jsonc = prettier(),
			yaml = prettier(),
			markdown = prettier(),

			lua = { "stylua" },
			sh = { "shfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			python = { "ruff_fix", "ruff_format" },
			toml = { "taplo" },
		},
		format_on_save = {
			timeout_ms = 1500,
			lsp_format = "fallback",
		},
		notify_on_error = true,
		notify_no_formatters = false,
	},
}
