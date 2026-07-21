return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>pf",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files",
		},
		{
			"<C-p>",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Find Git files",
		},
		{
			"<leader>ps",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Search project",
		},
		{
			"<leader>pw",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "Search word under cursor",
		},
		{
			"<leader>pb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find buffers",
		},
		{
			"<leader>vh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Search help",
		},
	},
	opts = {
		defaults = {
			prompt_prefix = "❯ ",
			selection_caret = "❯ ",
			file_ignore_patterns = {
				"node_modules/",
				"%.git/",
				"%.svelte%-kit/",
				"build/",
				"dist/",
				"__pycache__/",
				"%.pyc",
			},
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					preview_width = 0.55,
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"--glob",
					"!.git",
				},
			},
			git_files = { theme = "ivy" },
			help_tags = { theme = "ivy" },
		},
	},
}
