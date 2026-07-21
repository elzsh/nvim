return {
	"tpope/vim-fugitive",
	cmd = {
		"Git",
		"G",
		"Gdiffsplit",
		"Gvdiffsplit",
		"Gread",
		"Gwrite",
	},
	keys = {
		{
			"<leader>gs",
			"<cmd>Git<CR>",
			desc = "Git status",
		},
	},
}
