return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")

			local mason_lspconfig = require("mason-lspconfig")

			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"dockerls",
					"docker_compose_language_service",
					"gopls",
					"clangd",
					"lua_ls",
					"bashls",
					"basedpyright",
				},
				automatic_installation = true,
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"clang-format",
					"gofumpt",
					"goimports-reviser",
					"staticcheck",
					"prettier",
					"stylua",
					"ruff",
					"hadolint",
					"jsonlint",
					"rust-analyzer",
				},
			})
		end,
	},
}
