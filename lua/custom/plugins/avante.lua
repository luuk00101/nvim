return {
	{
		enabled = true,
		"yetone/avante.nvim",
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = { file_types = { "Avante", "markdown" } },
				ft = { "Avante", "markdown" },
			},
		},
		config = function()
			require("avante").setup({
				provider = "claude",
				custom_tools = {},
				hints = { enabled = false },
			})
		end,
	},
}
