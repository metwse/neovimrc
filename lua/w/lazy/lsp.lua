-- Configs for Nvim LSP (language server protocol).

return {
  "neovim/nvim-lspconfig",
  lazy = false,

  dependencies = {
    -- Portable package manager for Neovim that runs everywhere Neovim runs.
    -- Install and manage LSP servers, DAP servers, linters, and formatters.
    { "mason-org/mason.nvim", opts = {} },

    -- Extension to mason.nvim that makes it easier to use lspconfig with
    -- mason.nvim.
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "lua_ls", "pylsp", "clangd" },

        -- Installed servers are enabled with vim.lsp.enable(). Rust is excluded
        -- because rustaceanvim owns that LSP client.
        automatic_enable = {
          exclude = { "rust_analyzer" },
        },
      }
    },

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

    -- Rust.
    {
      "mrcjkb/rustaceanvim",
      version = "9.*",
      lazy = false,
    },
    "rust-lang/rust.vim",

    -- Completion.
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
  },

  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")

    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    -- Neovim 0.12: defaults inherited by every vim.lsp.config definition,
    -- including the server managed by rustaceanvim.
    vim.lsp.config("*", { capabilities = capabilities, })

    vim.lsp.config("clangd", {
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
  end,

  keys = {
    {
      "<leader>(",
      function()
        vim.diagnostic.jump({ count = -1, float = true })
      end,
    },

    {
      "<leader>)",
      function()
        vim.diagnostic.jump({ count = 1, float = true })
      end,
    },

    { "g?", vim.diagnostic.open_float, },
    { "g/", vim.lsp.buf.hover, },
    { "gd", vim.lsp.buf.declaration, },
    { "gD", vim.lsp.buf.definition, },
    { "gr", vim.lsp.buf.references, },
    { "gs", vim.lsp.buf.rename, },
  },
}
