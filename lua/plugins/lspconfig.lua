return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.config("clangd", {
			cmd = {
				"clangd",
				"--function-arg-placeholders=0",
			},
		})

		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					analysis = {
						diagnosticMode = "openFilesOnly",
						reportUnusedImport = "none",
						reportUnusedVariable = "none",
						reportMissingTypeStubs = false,
						typeCheckingMode = "standard",
						useLibraryCodeForTypes = true,
					},
				},
			},
		})

		vim.lsp.config("ruff", {
			on_attach = function(client)
				-- BasedPyright provides the richer Python hover response.
				client.server_capabilities.hoverProvider = false
			end,
		})

		vim.lsp.config("vtsls", {
			settings = {
				vtsls = {
					autoUseWorkspaceTsdk = true,
				},
				typescript = {
					updateImportsOnFileMove = { enabled = "always" },
					suggest = { completeFunctionCalls = true },
				},
				javascript = {
					updateImportsOnFileMove = { enabled = "always" },
					suggest = { completeFunctionCalls = true },
				},
			},
		})

		vim.lsp.config("eslint", {
			settings = {
				workingDirectory = { mode = "auto" },
			},
		})

		vim.diagnostic.config({
			severity_sort = true,
			update_in_insert = false,
			underline = true,
			virtual_text = {
				spacing = 2,
				source = "if_many",
				prefix = "●",
			},
			float = {
				border = "rounded",
				source = "if_many",
			},
		})

		local group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = group,
			callback = function(args)
				local bufnr = args.buf
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = bufnr,
						remap = false,
						desc = desc,
					})
				end

				map("n", "gd", vim.lsp.buf.definition, "Go to definition")
				map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
				map("n", "gr", vim.lsp.buf.references, "List references")
				map("n", "K", vim.lsp.buf.hover, "Hover information")
				map("n", "gl", vim.diagnostic.open_float, "Show line diagnostics")
				map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
				map("n", "[d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, "Previous diagnostic")
				map("n", "]d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, "Next diagnostic")
				map("n", "<leader>th", function()
					local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
					vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
				end, "Toggle inlay hints")
			end,
		})
	end,
}
