require("neodev").setup({})

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

local lspconfig = require("lspconfig")

local servers = {
	bashls = true,
	lua_ls = true,
	cssls = true,
	ts_ls = true,
	phpactor = true,
	tailwindcss = true,
	pyright = true,

	clangd = {
		init_options = { clangdFileStatus = true },
		filetypes = { "c", "cpp" },
		cmd = { "clangd", "--offset-encoding=utf-16" },
	},
}

local servers_to_install = vim.tbl_filter(function(key)
	local t = servers[key]
	if type(t) == "table" then
		return not t.manual_install
	else
		return t
	end
end, vim.tbl_keys(servers))

require("mason").setup()
local ensure_installed = {
	"clangd",
	"clang-format",

	"stylua",
	"lua_ls",

	"ts_ls",

	"prettier",
	"tailwindcss",

	"phpactor",
	"phpcs",
	"phpstan",
	"phpcbf",

	"pyright",
	"black",
	"isort",
}

vim.list_extend(ensure_installed, servers_to_install)
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

for name, config in pairs(servers) do
	if config == true then
		config = {}
	end
	config = vim.tbl_deep_extend("force", {}, {
		capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities),
		handlers = handlers,
	}, config)

	lspconfig[name].setup(config)
end

local disable_semantic_tokens = {
	lua = true,
}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

		vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, { buffer = 0 })

		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = 0 })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })

		local filetype = vim.bo[bufnr].filetype
		if disable_semantic_tokens[filetype] then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

-- Autoformatting Setup
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clang_format" },
		c = { "clang_format" },
		javascript = { "prettier" },
		php = { "phpcbf" },
		python = { "black", "isort" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		require("conform").format({
			bufnr = args.buf,
			lsp_fallback = true,
			quiet = true,
		})
	end,
})
