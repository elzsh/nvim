return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			dockerfile = { "hadolint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
