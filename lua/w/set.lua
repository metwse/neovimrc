vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/backupdir"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.colorcolumn = "80"

vim.opt.list = true
vim.opt.listchars = "tab:│ ,trail:█,extends:…,nbsp:‿"
vim.opt.showbreak = "↪"
