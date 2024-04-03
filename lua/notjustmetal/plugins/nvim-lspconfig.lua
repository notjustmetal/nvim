return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
  },

  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig.lua_ls.setup({
      capabilities = capabilities,

      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })

    lspconfig.tsserver.setup({
      capabilities = capabilities
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),

      callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set(
          "n",
          "<leader>caf",
          function()
            vim.lsp.buf.format({ async = true })
          end,
          opts
        )

        vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = "󰋽", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶", texthl = "DiagnosticSignHint" })
      end
    })
  end
}
