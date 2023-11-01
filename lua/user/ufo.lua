local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
	return
end

vim.keymap.set("n", "zR", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)

local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
	return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local language_servers = lsp_config.util.available_servers()
for _, ls in ipairs(language_servers) do
	lsp_config[ls].setup({
		capabilities = capabilities,
	})
end

ufo.setup()

local status_ok, statuscol = pcall(require, "statuscol")
if not status_ok then
	return
end

local status_ok, builtin = pcall(require, "statuscol.builtin")
if not status_ok then
	return
end

statuscol.setup({
	foldfunc = "builtin",
	setopt = true,
	relculright = true,
	segments = {
		{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
		{ text = { "%s" }, click = "v:lua.ScSa" },
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	},
})
