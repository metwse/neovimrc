-- Treesitter (which provides some basic functionality such as syntax
-- highlighting) configurations and abstraction layer for Neovim.

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,

  build = ":TSUpdate",

  config = function()
    local ts = require("nvim-treesitter")

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("w-treesitter-auto-install", { clear = true}),

      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        local language = vim.treesitter.language.get_lang(filetype)

        if not language then
          return
        end

        if vim.list_contains(ts.get_installed(), language) then
          vim.treesitter.start(args.buf, language)
          return
        end

        if not vim.list_contains(ts.get_available(), language) then
          return
        end

        ts.install(language):await(function()
          if not vim.api.nvim_buf_is_loaded(args.buf) then
            return
          end

          vim.treesitter.start(args.buf, language)
        end)
      end
    })
  end
}
