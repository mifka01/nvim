local colorscheme = "rose-pine"

local status_ok, rose = pcall(require, "rose-pine")
if not status_ok then
	return
end

rose.setup({
	disable_background = true,
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
