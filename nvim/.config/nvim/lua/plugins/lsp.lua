return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"b0o/schemastore.nvim",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
				callback = function(ev)
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, {
							buffer = ev.buf,
							desc = desc,
							silent = true,
						})
					end

					map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
					map("n", "gr", vim.lsp.buf.references, "References")
					map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
					map("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
					map("n", "gy", vim.lsp.buf.type_definition, "Goto Type Definition")
					map("n", "K", vim.lsp.buf.hover, "Hover")
					map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
					map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
					map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
					map("n", "<leader>cf", function()
						vim.lsp.buf.format({ async = true })
					end, "Format")
				end,
			})

			vim.lsp.enable({
				"bashls",
				"jsonls",
				"yamlls",
				"dockerls",
				"docker_compose_language_service",
				"clangd",
				"pyright",
				"rust_analyzer",
				"gopls",
				"lua_ls",
			})
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"bashls",
				"jsonls",
				"yamlls",
				"dockerls",
				"docker_compose_language_service",
				"clangd",
				"pyright",
				"rust_analyzer",
				"gopls",
				"lua_ls",
			},

			automatic_enable = false,
		},
	},
}
