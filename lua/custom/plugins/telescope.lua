local data = assert(vim.fn.stdpath("data")) --[[@as string]]

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-smart-history.nvim",
			"kkharji/sqlite.lua",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					wrap_results = true,

					fzf = {},
					history = {
						path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
						limit = 100,
					},
				},
			})

			-- General
			vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
			vim.keymap.set("n", "<leader>fs", require("custom.plugins.telescope.multigrep_picker"))
			vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)

			-- Config
			vim.keymap.set("n", "<leader>en", function()
				local opts = require("telescope.themes").get_ivy({
					cwd = vim.fn.stdpath("config"),
				})
				require("telescope.builtin").find_files(opts)
			end)
			vim.keymap.set("n", "<leader>ep", function()
				local opts = require("telescope.themes").get_ivy({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
				require("telescope.builtin").find_files(opts)
			end)

			-- LSP
			vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
			vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
			vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations)
			vim.keymap.set("n", "<leader>D", function()
				require("telescope.builtin").diagnostics({
					bufnr = 0,
				})
			end)
		end,
	},
}
