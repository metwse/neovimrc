-- Wayland support for clipboard.

return {
  "jasonccox/vim-wayland-clipboard",
  commit = "2fa6178",
  lazy = false,
  enabled = vim.env.XDG_SESSION_TYPE == 'wayland'
}
