local augroup = vim.api.nvim_create_augroup(
  "w-trailing-whitespace", { clear = true }
)

vim.api.nvim_create_autocmd("InsertEnter", {
  group = augroup,
  callback = function()
    vim.api.nvim_set_hl(0, "WTrailingWhitespace", { link = "Whitespace" })
  end
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = augroup,
  callback = function()
    vim.api.nvim_set_hl(0, "WTrailingWhitespace", { link = "Error" })
  end
})

vim.cmd.match([[WTrailingWhitespace /\s\+$/]])
vim.api.nvim_set_hl(0, "WTrailingWhitespace", { link = "Error" })
