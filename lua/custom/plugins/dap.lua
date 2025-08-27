return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",

		"nvim-neotest/nvim-nio",

		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- Language-specific debuggers
		"leoluz/nvim-dap-go", -- Golang
		"mfussenegger/nvim-dap-python", -- Python

		"theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		{
			"<leader>Dc",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<leader>Dsi",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<leader>DsO",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<leader>Dso",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<leader>Db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<leader>DB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Set Conditional Breakpoint",
		},
		{
			"<leader>Dt",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: Toggle UI",
		},
		{
			"<leader>Dl",
			function()
				require("dap").run_last()
			end,
			desc = "Debug: Run Last Configuration",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {
				"delve",
				"debugpy",
			},
		})

		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		require("nvim-dap-virtual-text").setup({})

		require("dap-go").setup({})

		require("dap-python").setup("python3")
	end,
}
