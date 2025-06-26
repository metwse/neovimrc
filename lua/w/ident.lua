local wild_tab = { "*.c", "*.h", "Makefile" }
local wild_2spaces = {
  "*.html", "*.jsx", "*.tsx",
  "*.js", "*.ts", "*.css", "*.lua"
}


vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = wild_tab,
  group = vim.api.nvim_create_augroup("w-ident-tab", { clear = true }),
  callback = function()
    vim.opt.tabstop = 8
    vim.opt.shiftwidth = 8
    vim.opt.expandtab = false
  end
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = wild_2spaces,
  group = vim.api.nvim_create_augroup("w-ident-2spaces", { clear = true }),
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
  end
})
