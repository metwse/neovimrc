return {
  "nvim-treesitter/nvim-treesitter",

  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "elixir", "heex", "javascript",
        "html", "css", "rust"
      },
      auto_install = true,
      sync_install = false,
      indent = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      },
    })
  end,

  build = ":TSUpdate",
}
