return {
	{
		"dense-analysis/ale",
		config = function()
			local project_root = vim.fn.getcwd()
			require("ale").setup({
				ale_linters = {
					php = { "phpstan" },
				},
				ale_php_phpstan_executable = project_root .. "phpstan",
				ale_filename_mappings = {
					phpstan = {
						{ project_root .. "/app", "/var/www" },
					},
				},
				ale_php_phpstan_use_global = 1,
				ale_linters_explicit = 1,
			})
		end,
	},
}
