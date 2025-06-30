-- Telescope is a highly extendable fuzzy finder over lists.

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    -- A Lua module for asynchronous programming using coroutines.
    "nvim-lua/plenary.nvim",
  },
  branch = "0.1.x",
  lazy = false,

  opts = {},

  init = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fu", builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set("n", "<leader>fy", builtin.registers, {})
    vim.keymap.set("n", "<leader>fa", builtin.builtin, {})
  end
}
