return {
	{
		"dense-analysis/ale",
		config = function()
			local project_root = vim.fn.getcwd()
			local config_dir = vim.fn.expand("<sfile>:h")
			local mappings = {}

			if string.find(project_root, "xaver") then
				mappings = {
					phpstan = {
						{ project_root .. "/app", "/var/www" },
						{ project_root .. "/bundles", "/var/bundles" },
					},
				}
			else
				mappings = {
					phpstan = {
						{ project_root .. "/", "/var/www/" },
					},
				}
			end

			require("ale").setup({
				linters = {
					php = { "phpstan" },
				},
				php_phpstan_executable = config_dir .. "/lua/custom/phpstan",
				php_phpstan_configuration = "/var/www/phpstan.neon",
				php_phpstan_level = "max",
				php_phpstan_use_global = 1,
				linters_explicit = 1,
				filename_mappings = mappings,
			})
		end,
	},
}
