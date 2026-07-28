-- Getting you where you want with the fewest keystrokes.

local harpoon_keys = { "j", "k", "l", ":", "u", "i", "o", "p" }

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  opts = {},

  keys = function()
    local harpoon = require("harpoon");

    local keys = {
      { "<leader>a", function() harpoon:list():add() end },

      {
        "<leader>e",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end
      },
    }

    for i, key in ipairs(harpoon_keys) do
      table.insert(keys, {
        "<leader>" .. key,
        function () harpoon:list():select(i) end
      })
    end

    return keys
  end,
}
