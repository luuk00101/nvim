return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
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
			-- list of servers for mason to install
			ensure_installed = {
				"dockerls",
				"docker_compose_language_service",
				"gopls",
				"clangd",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_ls",
				"pyright",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"clang-format", -- c/c++ formatter
				"gofumpt",
				"goimports-reviser",
				"staticcheck",
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"ruff", -- python linter and formatter
				"mypy", -- python type checker
				"eslint_d", -- eslint language server
				"rust-analyzer",
			},
		})
	end,
}
