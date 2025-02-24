return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = {
				enabled = true,
				size = 1 * 1024 * 1024, -- 1MB
			},
			picker = {
				enabled = true,
				layout = {
					preset = "telescope",
					layout = {
						box = "horizontal",
						width = 0.8,
						min_width = 120,
						height = 0.9,
						{
							box = "vertical",
							border = "rounded",
							title = "{title} {live} {flags}",
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
						{ win = "preview", title = "{preview}", border = "rounded", width = 0.55 },
					},
				},
			},
			quickfile = { enabled = true },
			scroll = { enabled = true },
		},
		keys = {
			-- find
			{
				"<leader>ff",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
		},
	},
}
