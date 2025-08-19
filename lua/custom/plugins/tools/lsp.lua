return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			-- To enable diagnostic virtual text (disabled by default??)
			vim.diagnostic.config({
				virtual_text = true,
				float = { border = "rounded" },
			})

			-- Keymaps
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.get_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.get_next)

			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>")

			-- Enable LSPs
			local enabled_lsps = {
				"lua_ls",
				"basedpyright",
				"ts_ls",
				"ruff",
				"gopls",
				"bashls",
				"clangd",
				"dockerls",
				"docker_compose_language_service",
				"ols",
				"postgres_lsp",
				"tailwindcss",
				"eslint",
			}

			for _, lsp in ipairs(enabled_lsps) do
				vim.lsp.enable(lsp)
			end
		end,
	},
}
