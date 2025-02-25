return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		opts = {
			inlay_hints = {
				enabled = true,
			},
		},
	},
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

				opts.desc = "Toggle inlay hints"
				keymap.set("n", "<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, opts)
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local on_attach = function(client, bufnr) end

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["gopls"] = function()
				lspconfig["gopls"].setup({
					on_attach = on_attach,
					capabilities = capabilities,
					filetypes = { "go", "gomod", "gomod", "gowork", "gotmpl" },
					root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
					settings = {
						gopls = {
							staticcheck = true,
							gofumpt = true,
							analyses = {
								unusedparams = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
						},
					},
				})
			end,
			["basedpyright"] = function()
				lspconfig["basedpyright"].setup({
					-- Turn on inlay hints by default
					-- on_attach = function(client, bufnr)
					-- 	on_attach(client, bufnr)
					-- 	-- Enable inlay hints if supported
					-- 	if client.server_capabilities.inlayHintProvider then
					-- 		vim.lsp.inlay_hint.enable(true)
					-- 	end
					-- end,
					-- Only leave type checkng on
					-- capabilities = (function()
					-- 	local capabilities = vim.lsp.protocol.make_client_capabilities()
					-- 	capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
					-- 	return capabilities
					-- end)(),
					on_attach = on_attach,
					settings = {
						pyright = {
							-- Using Ruff's import organizer
							disableOrganizeImports = true,
						},
						basedpyright = {
							analysis = {
								typeCheckingMode = "basic",
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								-- ignore = { "*" }, -- ignores ALL diagnostics
							},
						},
					},
					root_dir = function(fname)
						return lspconfig.util.root_pattern(
							"pyproject.toml",
							"setup.py",
							"setup.cfg",
							"requirements.txt",
							"Pipfile",
							"pyrightconfig.json",
							".git"
						)(fname) or vim.fn.getcwd()
					end,
				})
			end,
			["ruff"] = function()
				lspconfig["ruff"].setup({
					on_attach = function(client, bufnr)
						-- Disable hover in favor of Pyright
						client.server_capabilities.hoverProvider = false
						on_attach(client, bufnr)
					end,
					init_options = {
						settings = {
							lint = {
								-- select = { "E", "F", "ARG" },
								ignore = { "F401", "F821", "F841" },
							},
						},
					},
				})
			end,
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
					filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}
