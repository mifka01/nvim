return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			indent = { enable = true },
			bigfile = {
				enabled = true,
				size = 1 * 1024 * 1024, -- 1MB
			},
			scroll = {
				animate = {
					duration = { step = 5, total = 150 },
				},
			},
			picker = {
				enabled = true,
				layout = {
					preview = false,
					layout = {
						backdrop = false,
						row = 1,
						width = 0.5,
						min_width = 80,
						height = 0.5,
						box = "vertical",
						{
							win = "input",
							height = 1,
							border = "rounded",
							title = "{title} {live} {flags}",
							title_pos = "center",
						},
						{ win = "list", border = "hpad" },
						{ win = "preview", title = "{preview}", border = "rounded" },
					},
				},
				formatters = {
					file = {
						filename_first = true,
						truncate = 100,
					},
				},
				win = {
					input = {
						keys = {
							["<c-a>"] = { "toggle_ignored", mode = { "i", "n" } },
						},
					},
					list = {
						keys = {
							["<c-a>"] = { "toggle_ignored", mode = { "i", "n" } },
						},
					},
				},
				sources = {
					explorer = {
						layout = {
							auto_hide = { "input" },
							layout = {
								backdrop = false,
								width = 60,
								min_width = 60,
								height = 0,
								position = "left",
								border = "none",
								box = "vertical",
								{
									win = "input",
									height = 1,
									border = "rounded",
									title = "{title} {live} {flags}",
									title_pos = "center",
								},
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", height = 0.2, border = "top" },
							},
						},
					},
				},
			},
			quickfile = { enabled = true },
		},
		keys = {
			-- find
			{
				"<leader>ff",
				function()
					Snacks.picker.smart({ hidden = true, filter = { cwd = true } })
				end,
				desc = "Smart Find Files",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers({ hidden = true })
				end,
				desc = "Buffers",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep({ hidden = true })
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
			{
				"<leader>E",
				function()
					Snacks.explorer.open()
				end,
				desc = "Toggle Explorer",
			},
			{
				"<leader>re",
				function()
					Snacks.explorer.reveal()
				end,
				desc = "Toggle Explorer",
			},
		},
	},
}
