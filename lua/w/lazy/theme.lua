return {
  "sainnhe/sonokai",
  lazy = false,
  priority = 1000,

  init = function()
    vim.cmd.colorscheme("sonokai")

    vim.api.nvim_set_hl(0, "Normal", {})
    vim.api.nvim_set_hl(0, "EndOfBuffer", {})
  end
}
