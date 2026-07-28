-- Telescope is a highly extendable fuzzy finder over lists.

return {
  "nvim-telescope/telescope.nvim",
  version = "0.2.*",

  dependencies = {
    -- A Lua module for asynchronous programming using coroutines.
    "nvim-lua/plenary.nvim",
  },

  opts = {},

  keys = function()
    local builtin = require("telescope.builtin")

    return {
      { "<leader>ff", builtin.find_files, },
      { "<leader>fl", builtin.live_grep, },
      { "<leader>fh", builtin.help_tags, },
      { "<leader>fb", builtin.buffers, },
      { "<leader>f/", builtin.current_buffer_fuzzy_find, },
      { "<leader>fy", builtin.registers, },
      { "<leader>fa", builtin.builtin, },
    }
  end
}
