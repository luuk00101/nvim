return {
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		build = function()
			vim.cmd.GoInstallDeps()
		end,
		config = function()
			vim.keymap.set("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>")
		end,
	},
}
