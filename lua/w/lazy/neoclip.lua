-- Clipboard manager neovim plugin with telescope integration.

return {
  "AckslD/nvim-neoclip.lua",
  lazy = false,

  dependencies = {
    "nvim-telescope/telescope.nvim",
    { "kkharji/sqlite.lua", module = "sqlite" },
  },

  opts = {
    history = 1024,
    enable_persistent_history = true,
  },

  keys = function()
    local telescope = require("telescope")

    local keys = {
      { "<leader><leader>y", telescope.extensions.neoclip.unnamed, },
      { "<leader>y+", telescope.extensions.neoclip.plus, },
      { "<leader>y*", telescope.extensions.neoclip.star, },
    }

    local registers = "abcdefghijklmnopqrstuvwxyz123456789"

    for i = 1, #registers do
      local c = registers:sub(i, 1);

      table.insert(keys, { "<leader>y" .. c, telescope.extensions.neoclip[c] })
    end

    return keys
  end,
}
