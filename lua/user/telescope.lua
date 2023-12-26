local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		theme = "center",
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				width = 0.9,
				preview_width = 0.4,
			},
		},
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},
})
