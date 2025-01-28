return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- configure lualine with modified theme
		lualine.setup({
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			tabline = {
				lualine_a = {
					{ "filetype", icon_only = true },
				},
				lualine_b = {
					{ "tabs", mode = 2, max_length = vim.o.columns },
					{
						function()
							vim.o.showtabline = 1
							return ""
							--HACK: lualine will set &showtabline to 2 if you have configured
							--lualine for displaying tabline. We want to restore the default
							--behavior here.
						end,
					},
				},
			},
		})
	end,
}
