return {
	"marko-cerovac/material.nvim",
	priority = 1000,
	config = function()
		require("material").setup({
			contrast = {
				floating_windows = true, -- Enable contrast for floating windows
			},

			plugins = { -- Uncomment the plugins that you use to highlight them
				-- Available plugins:
				-- "coc",
				-- "colorful-winsep",
				-- "dap",
				"dashboard",
				-- "eyeliner",
				-- "fidget",
				-- "flash",
				"gitsigns",
				-- "harpoon",
				-- "hop",
				-- "illuminate",
				"indent-blankline",
				-- "lspsaga",
				-- "mini",
				-- "neogit",
				-- "neotest",
				-- "neo-tree",
				-- "neorg",
				-- "noice",
				"nvim-cmp",
				-- "nvim-navic",
				-- "nvim-tree",
				"nvim-web-devicons",
				-- "rainbow-delimiters",
				-- "sneak",
				"telescope",
				-- "trouble",
				"which-key",
				-- "nvim-notify",
			},

			lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
		})

		vim.g.material_style = "darker"
		vim.cmd("colorscheme material")
	end,
}
