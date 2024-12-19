local opt = vim.opt

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
