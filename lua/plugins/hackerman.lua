return {
	"bjarneo/hackerman.nvim",
	dependencies = { "bjarneo/aether.nvim" }, -- Keep the dependency
	priority = 1000, -- Load this before all other plugins to prevent screen flicker
	config = function()
		-- This is the standard way to set a theme in Neovim
		vim.cmd.colorscheme("hackerman")
	end,
}
