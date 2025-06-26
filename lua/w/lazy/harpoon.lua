local harpoon_keys = { "j", "k", "l", ":", "u", "i", "o", "p" }

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  opts = {},

  init = function()
    local harpoon = require("harpoon")
    local ui = harpoon.ui

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)

    vim.keymap.set("n", "<leader>e", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    for i, key in ipairs(harpoon_keys) do
      vim.keymap.set("n", "<leader>" .. key, function()
        harpoon:list():select(i)
      end)
    end

    vim.keymap.set("n", "<leader><leader>n", function()
      harpoon:list():next()
    end)
    vim.keymap.set("n", "<leader><leader>p", function()
      harpoon:list():prev()
    end)
  end
}
