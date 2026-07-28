-- Treesitter (which provides some basic functionality such as syntax
-- highlighting) configurations and abstraction layer for Neovim.

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,

  build = ":TSUpdate",
}
