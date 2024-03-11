local status_ok, files = pcall(require, "mini.files")
if not status_ok then
	return
end

files.setup({

	mappings = {
		go_in = "l",
		go_in_plus = "l",
		go_out = "H",
		go_out_plus = "h",
	},
})
