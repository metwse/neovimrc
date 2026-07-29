require("w.set")
require("w.trailing_whitespace")
require("w.remap")
require("w.ident")

if vim.env.NVIM_ENABLE_PLUGINS then
  require("w.lazy_init")
end
