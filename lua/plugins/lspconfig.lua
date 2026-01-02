return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
				},
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			float = { border = "rounded" },
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
			callback = function(args)
				local bufnr = args.buf
				local bufopts = { buffer = bufnr, remap = false }

				local keymaps = {
					{ "n", "gd", vim.lsp.buf.definition, "Go to definition" },
					{ "n", "K", vim.lsp.buf.hover, "Hover information" },
					{ "n", "gr", vim.lsp.buf.references, "References" },
					{ "n", "gl", vim.diagnostic.open_float, "Show line diagnostics" },
					{ "n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol" },
					{ "n", "<leader>ca", vim.lsp.buf.code_action, "Code action" },
				}

				for _, km in ipairs(keymaps) do
					vim.keymap.set(km[1], km[2], km[3], vim.tbl_extend("force", bufopts, { desc = km[4] }))
				end
			end,
		})
	end,
}
