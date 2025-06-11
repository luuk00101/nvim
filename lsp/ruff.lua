return {
	init_options = {
		settings = {
			lint = {
				ignore = { "F401", "F821", "F841" },
				select = { "E302", "E501" },
			},
		},
	},
	capabilities = {
		general = {
			positionEncodings = { "utf-16" },
		},
	},
}
