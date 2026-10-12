return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		local available = ts.get_available()

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(event)
				local lang = vim.treesitter.language.get_lang(event.match)

				if not lang then
					return
				end

				if vim.treesitter.language.add(lang) then
					vim.treesitter.start(event.buf)
				elseif vim.tbl_contains(available, lang) then
					ts.install(lang):await(function(err, success)
						if
							not err
							and success
							and vim.api.nvim_buf_is_valid(event.buf)
							and vim.treesitter.language.add(lang)
						then
							vim.treesitter.start(event.buf)
						end
					end)
				end
			end,
		})
	end,
}
