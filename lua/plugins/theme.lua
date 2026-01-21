return {
	"rose-pine/neovim",
	name = "rose-pine",
	opts = {
		variant = "auto",
		dim_inactive_windows = true,

		styles = {
			transparency = true,
		},
	},

	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
}
