local workspace = require("custom.workspace")

return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters.phpstan = {
				cmd = vim.fn.stdpath("config") .. "/lua/custom/phpstan",
				stdin = false,
				append_fname = false,
				args = { "analyze", "--error-format=json", workspace.get_container_path },
				stream = "both",
				ignore_exitcode = true,
				parser = function(output, bufnr)
					if output == "" then
						return {}
					end

					local ok, decoded = pcall(vim.json.decode, output)
					if not ok or not decoded or not decoded.files then
						return {}
					end

					local diagnostics = {}
					local bufname = vim.api.nvim_buf_get_name(bufnr)

					for filepath, filedata in pairs(decoded.files) do
						local local_path = workspace.get_local_path(filepath)

						if local_path == bufname then
							for _, error in ipairs(filedata.messages or {}) do
								table.insert(diagnostics, {
									lnum = (error.line or 1) - 1,
									col = (error.column or 1) - 1,
									message = error.message,
									severity = vim.diagnostic.severity.ERROR,
									source = "phpstan",
								})
							end
						end
					end

					return diagnostics
				end,
			}

			lint.linters_by_ft = {
				php = { "phpstan" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				group = lint_augroup,
				pattern = "*.php",
				callback = function()
					lint.try_lint(nil, { cwd = workspace.get_lint_root() })
				end,
			})
		end,
	},
}
