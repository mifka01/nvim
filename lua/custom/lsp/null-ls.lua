local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
	return
end

mason_null_ls.setup({
	ensure_installed = {
		"phpcsfixer",
		"phpcs",
		"autopep8",
		"isort",
		"stylua",
		"prettier",
		"clang-format",
	},
	automatic_installation = true,
})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,

	sources = {
		formatting.prettier.with({
			extra_filetypes = { "toml" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),

		-- Python
		formatting.autopep8,
		formatting.isort,

		-- PHP
		formatting.phpcsfixer.with({
			extra_args = { "--rules=@PEAR" },
		}),

		diagnostics.phpcs.with({
			extra_args = { "--standard=PEAR" },
		}),

		-- LUA
		formatting.stylua,

		-- CLANG
		formatting.clang_format.with({
			extra_args = { "-style=chromium" },
		}),
	},
})
