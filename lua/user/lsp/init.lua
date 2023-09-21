local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
	return
end


lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)



local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup()

local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

mason_lsp.setup({
	ensure_installed = {
		"tsserver",
		"pyright",
		"cssls",
		"html",
		"bashls",
		"yamlls",
		"html",
		"intelephense",
		"jsonls",
		"clangd",
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			lspconfig.lua_ls.setup(lua_opts)
		end,
	},
})


local status_ok, null_ls = pcall(require, "user.lsp.null-ls")
if not status_ok then
	return
end

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	return
end



local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_format = lsp.cmp_format()
local cmp_action = lsp.cmp_action()

local status_ok, snippets= pcall(require, "luasnip.loaders.from_vscode")
if not status_ok then
	return
end

snippets.lazy_load()


cmp.setup({
    sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip'},
    },
	formatting = cmp_format,
	mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    }),
    window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})

lsp.setup()

local status_ok, diag = pcall(require, "toggle_lsp_diagnostics")
if not status_ok then
	return
end

diag.init({ virtual_text = false, underline = false })
