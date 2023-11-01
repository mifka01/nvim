local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = {},
		component_separators = "│",
		section_separators = "|",
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				padding = 0,
				fmt = function(str)
					local mode = str:sub(1, 1):upper() .. str:sub(2):lower()
					return "[" .. mode .. "]"
				end,
			},
		},
		lualine_b = {
			{
				"filename",
				file_status = true,
				path = 4,
				shorting_target = 40,
			},
			branch,
		},
		lualine_c = {},
		lualine_x = {
			{
				"datetime",
				style = "%H:%M:%S",
			},
			"encoding",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		-- lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
