-- Undotree visualizes the undo history and makes it easy to browse and switch
-- between different undo branches.

return {
  "mbbill/undotree",

  keys = {
    { "<leader>u", vim.cmd.UndotreeToggle },
  },
}
