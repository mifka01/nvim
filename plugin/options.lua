local opt = vim.opt

vim.diagnostic.config({})

opt.background = "dark"

opt.inccommand = "split"

opt.list = true

opt.smartcase = true
opt.ignorecase = true

opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

opt.showtabline = 0

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

-- Don't have `o` add a comment
opt.formatoptions:remove("o")

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

opt.showmode = false
opt.termguicolors = true

opt.wrap = false

opt.cursorline = true

opt.conceallevel = 0

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.cmdheight = 2

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

--- Diagnostic Settings
vim.diagnostic.config({
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.ERROR }, -- only show virtual text for errors
	},

	float = {
		border = "single",
		source = "if_many",
	},
})

vim.lsp.inlay_hint.enable(true)

vim.api.nvim_set_hl(0, "DiagnosticFloatingBorder", { fg = "#6272A4" })
local underline_groups = {
	{ group = "DiagnosticUnderlineError", link = "DiagnosticError" },
	{ group = "DiagnosticUnderlineWarn", link = "DiagnosticWarn" },
	{ group = "DiagnosticUnderlineInfo", link = "DiagnosticInfo" },
	{ group = "DiagnosticUnderlineHint", link = "DiagnosticHint" },
}

for _, g in ipairs(underline_groups) do
	local color = vim.api.nvim_get_hl_by_name(g.link, true)
	vim.api.nvim_set_hl(0, g.group, {
		undercurl = true,
		sp = color.foreground,
	})
end

vim.api.nvim_create_user_command("Run", function(opts)
	local cmd = table.concat(opts.fargs, " ")
	local bufname = "[Command Output]"

	-- Find existing buffer with this name
	local existing_buf = nil
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf):match(bufname) then
			existing_buf = buf
			break
		end
	end

	if existing_buf then
		-- Find window showing this buffer or create new split
		local win = vim.fn.bufwinid(existing_buf)
		if win == -1 then
			vim.cmd("vsplit")
			vim.api.nvim_set_current_buf(existing_buf)
		else
			vim.api.nvim_set_current_win(win)
		end
		-- Clear buffer content
		vim.api.nvim_buf_set_lines(existing_buf, 0, -1, false, {})
	else
		-- Create new split and buffer
		vim.cmd("vsplit")
		vim.cmd("enew")
		vim.cmd("setlocal buftype=nowrite bufhidden=wipe noswapfile wrap breakindent")
		vim.cmd("file " .. bufname)
	end

	vim.cmd("0read !" .. cmd)
	vim.cmd("normal! gg")
end, { nargs = "+" })
