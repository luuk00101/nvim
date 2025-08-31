return {
	{
		"NickvanDyke/opencode.nvim",
		opts = {
			auto_fallback_to_embedded = false,
		},
		keys = {
			{
				"<leader>oa",
				function()
					require("opencode").ask("@cursor: ")
				end,
				desc = "Ask opencode about this",
				mode = "n",
			},
			{
				"<leader>oa",
				function()
					require("opencode").ask("@selection: ")
				end,
				desc = "Ask opencode about selection",
				mode = "v",
			},
		},
	},
}
