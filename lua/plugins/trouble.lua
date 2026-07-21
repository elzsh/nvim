return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<CR>",
			desc = "Diagnostics",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
			desc = "Buffer diagnostics",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<CR>",
			desc = "Symbols",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
			desc = "LSP definitions and references",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<CR>",
			desc = "Location list",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<CR>",
			desc = "Quickfix list",
		},
	},
}
