local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({
            extra_filetypes = { "toml" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
        }),
        -- Python
        formatting.autopep8,
        formatting.isort,
        diagnostics.flake8,

        -- PHP
        formatting.phpcbf,
        formatting.phpcsfixer,
        diagnostics.php,

        -- LUA
        formatting.stylua,
    },
})