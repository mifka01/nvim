local options = {
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file

	hlsearch = true, -- highlight all matches on previous search pattern
	incsearch = true,

	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore

	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window

	swapfile = false, -- creates a swapfile
	backup = false, -- creates a backup file
	undodir = os.getenv("HOME") .. "/.vim/undodir",
	undofile = true,

	termguicolors = true, -- set term gui colors (most terminals support this)
	updatetime = 50, -- faster completion (4000ms default)

	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	softtabstop = 4,
	tabstop = 4, -- insert 4 spaces for a tab

	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	guifont = "monospace:h17", -- the font used in graphical neovim applications

	foldcolumn = "1",
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
	fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
