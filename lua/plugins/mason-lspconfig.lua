return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			-- SvelteKit frontend
			"svelte",
			"vtsls",
			"eslint",
			"html",
			"cssls",
			"jsonls",
			"yamlls",
			"taplo",

			-- Python API
			"basedpyright",
			"ruff",

			-- General development
			"lua_ls",
			"bashls",

			-- Existing languages from the original configuration
			"clangd",
			"gopls",

			-- Add only when the project starts using them:
			-- "tailwindcss",
			-- "emmet_language_server",
			-- "dockerls",
			-- "docker_compose_language_service",
		},
		automatic_enable = true,
	},
}
