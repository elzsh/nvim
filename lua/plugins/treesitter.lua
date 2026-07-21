local parsers = {
	"bash",
	"c",
	"cpp",
	"css",
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitattributes",
	"gitcommit",
	"gitignore",
	"html",
	"javascript",
	"json",
	"json5",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"scss",
	"svelte",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = function()
		if vim.fn.executable("tree-sitter") == 1 then
			vim.cmd("TSUpdate")
		end
	end,
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.setup({})

		local function install_configured_parsers()
			if vim.fn.executable("tree-sitter") == 0 then
				vim.notify(
					"tree-sitter CLI is not installed yet; run :MasonToolsInstall first",
					vim.log.levels.WARN
				)
				return
			end

			treesitter.install(parsers)
		end

		vim.api.nvim_create_user_command(
			"TSInstallConfigured",
			install_configured_parsers,
			{ desc = "Install all parsers configured for this setup" }
		)

		-- Installing an existing parser is a no-op, so this safely fills in
		-- anything missing after the tree-sitter CLI is available.
		if vim.fn.executable("tree-sitter") == 1 then
			install_configured_parsers()
		end

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
			callback = function(args)
				local ok = pcall(vim.treesitter.start, args.buf)
				if ok then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
