return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
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
					"clangd",
					"lua_ls",
					"bashls",
					"ts_ls",
					"ols",
					"jedi_language_server",
				},
				automatic_installation = true,
			})
		end,
	},
}
