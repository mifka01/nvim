local workspace = require("custom.workspace")

vim.lsp.config("vimfony", {
	cmd = { "vimfony" },
	filetypes = { "php", "twig", "yaml", "xml" },
	root_markers = { ".git" },
	single_file_support = true,
	init_options = {
		roots = { "templates", "app/templates" },
		container_xml_path = {
			workspace.find_container("website"),
			workspace.find_container("admin"),
			workspace.find_container("preview"),
		},
		vendor_dir = workspace.find_vendor_dir(),
	},
})

vim.lsp.enable("vimfony")
