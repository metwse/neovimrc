vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>d", '"+d')
vim.keymap.set("v", "<leader>d", '"+d')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>nn", ":Ex\n")
vim.keymap.set("n", "<leader>nh", ":Lex\n")
vim.keymap.set("n", "<leader>nj", ":Hex\n")
vim.keymap.set("n", "<leader>nk", ":Sex\n")
vim.keymap.set("n", "<leader>nl", ":Vex\n")
vim.keymap.set("n", "<leader>nt", ":Tex\n")

vim.keymap.set("n", "<leader>H", "<C-w>h")
vim.keymap.set("n", "<leader>J", "<C-w>j")
vim.keymap.set("n", "<leader>K", "<C-w>k")
vim.keymap.set("n", "<leader>L", "<C-w>l")

vim.cmd.ca("Q q")
vim.cmd.ca("W w")
vim.cmd.ca("WQ wq")
vim.cmd.ca("Wq wq")
vim.cmd.ca("wQ wq")
vim.cmd.ca("X x")
