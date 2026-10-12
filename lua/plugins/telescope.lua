return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	cmd = "Telescope",

	opts = {},

	config = function()
		local telescope = require("telescope")
		telescope.setup({})
		telescope.load_extension("fzf")
	end,

	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
		{ "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Find word under cursor" },
	},

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
}
