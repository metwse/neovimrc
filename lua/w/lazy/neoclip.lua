-- Clipboard manager neovim plugin with telescope integration.

return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    { "kkharji/sqlite.lua", module = "sqlite" },
  },

  opts = {
    history = 1024,
    enable_persistent_history = true,
  },

  init = function()
    local telescope = require("telescope")

    function neoclip_register(register, char)
      vim.keymap.set(
        "n", "<leader>y" .. char,
        telescope.extensions.neoclip[register]
      )
    end

    for c in ("abcdefghijklmnopqrstuvwxyz123456789"):gmatch(".") do
      neoclip_register(c, c)
    end

    neoclip_register("plus", "+")
    neoclip_register("star", "*")

    vim.keymap.set(
      "n", "<leader><leader>y",
      telescope.extensions.neoclip.unnamed
    )
  end
}
