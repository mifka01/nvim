local workspace = require("custom.workspace")
require("custom.lsp.vimfony")

local servers = {
	bashls = true,
	cssls = true,
	ts_ls = true,
	lua_ls = true,
	tailwindcss = true,
	pyright = true,

	clangd = {
		init_options = { clangdFileStatus = true },
		filetypes = { "c", "cpp" },
		cmd = { "clangd", "--offset-encoding=utf-16" },
	},

	intelephense = {
		settings = {
			intelephense = {
				files = {
					exclude = workspace.get_vendor_excludes(),
				},
			},
		},
	},
}

require("mason").setup()
local ensure_installed = {
	"bashls",
	"cssls",

	"clangd",
	"clang-format",

	"ts_ls",

	"prettier",
	"tailwindcss",
	"djlint",

	"php-cs-fixer",

	"pyright",
	"black",
	"isort",
}
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

for name, config in pairs(servers) do
	if config == true then
		config = {}
	end
	config = vim.tbl_deep_extend("force", {}, {
		capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities),
	}, config)

	vim.lsp.config[name] = config
	vim.lsp.enable(name)
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
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
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
		html = { "prettier" },
		yaml = { "prettier" },
		yml = { "prettier" },
		python = { "black", "isort" },
		php = { "php_cs_fixer" },
		twig = { "djlint" },
	},
	formatters = {
		php_cs_fixer = {
			command = "php-cs-fixer",
			args = function()
				local args = { "fix", "$FILENAME" }
				local config = workspace.find("php_cs_config")
				if config then
					table.insert(args, "--config=" .. config)
				end
				table.insert(args, "--allow-risky=yes")
				return args
			end,
			stdin = false,
		},
		djlint = {
			command = "djlint",
			args = { "--reformat", "-", "--max-attribute-length", "120", "--max-blank-lines", "1" },
			stdin = true,
		},
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
