-- Configs for Nvim LSP (language server protocol).

return {
  "neovim/nvim-lspconfig",

  dependencies = {
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Install and manage LSP servers, DAP servers, linters, and formatters.
    { "mason-org/mason.nvim", opts = {} },
    -- Extensible UI for Neovim notifications and LSP progress messages.
    { "j-hui/fidget.nvim", opts = {} },
    -- lazydev.nvim is a plugin that properly configures LuaLS for editing
    -- your Neovim config by lazily updating your workspace libraries.
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    -- Extension to mason.nvim that makes it easier to use lspconfig with
    -- mason.nvim.
    "mason-org/mason-lspconfig.nvim",
    -- Snippet engine.
    "L3MON4D3/LuaSnip",
    --  luasnip completion source for nvim-cmp.
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    {
      "mrcjkb/rustaceanvim",
      version = '^6',
      lazy = false,
    }
  },

  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")

    local capabilities = vim.tbl_deep_extend(
      "force", {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    vim.lsp.config("clangd", {
      capabilities = capabilities,
      settings = {
          clangd = {
              arguments = {
                  "-log=verbose",
                  "--background-index",
                  "--query-driver=/etc/alternatives/c++",
              },
          },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pylsp", "clangd" },
    })

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      })
    })

    vim.g.rustaceanvim = {
      server = {
        default_settings = {
          ['rust-analyzer'] = {
            cargo = {
              features = "all",
              targetDir = true
            },
            check = {
              command = "clippy"
            }
          },
        },
      },
    }
  end,

  init = function()
    vim.keymap.set("n", "g?", vim.diagnostic.open_float)
    vim.keymap.set("n", "<leader>(", function ()
      vim.diagnostic.jump({ count = -1, float = true })
    end)
    vim.keymap.set("n", "<leader>)", function ()
      vim.diagnostic.jump({ count = 1, float = true })
    end)

    vim.keymap.set("n", "G?", vim.lsp.buf.hover)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "gr", vim.lsp.buf.references)
    vim.keymap.set("n", "gs", vim.lsp.buf.rename)

    vim.diagnostic.config({
      float = {
        border = "rounded",
        source = true
      },
      severity_sort = true,
      virtual_text = {
        prefix = "▎"
      },
    })

    vim.api.nvim_create_user_command("RustFeatures", function(opts)
      vim.cmd.RustAnalyzer { "config", [[
        { cargo = { features = {
          ']] .. table.concat(vim.split(opts.args, "','")) .. [['
        } } }
      ]] }

      vim.cmd.RustAnalyzer { "restart" }
    end, { nargs = 1 })

  end
}
