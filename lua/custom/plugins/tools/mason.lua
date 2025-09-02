return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"dockerls",
					"docker_compose_language_service",
					"gopls",
					"ols",
					"rust_analyzer",
					"clangd",
					"lua_ls",
					"bashls",
					"ty",
					"postgres_lsp",
					"tailwindcss",
					"ts_ls",
					"eslint",
				},
				automatic_installation = true,
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"clang-format",
					"gofumpt",
					"goimports-reviser",
					"jsonlint",
					"pgformatter",
					"postgrestools",
					"prettier",
					"ruff",
					"staticcheck",
					"stylua",
				},

				run_on_start = true,
				integrations = {
					["mason-lspconfig"] = false,
					["mason-null-ls"] = false,
					["mason-nvim-dap"] = false,
				},
			})
		end,
	},
}
