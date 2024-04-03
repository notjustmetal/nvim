return {
  "williamboman/mason.nvim",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp"
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason.setup({})
    mason_lspconfig.setup({
      automatic_installation = true,

      ensure_installed = {
        "bashls",
        "cssls",
        "dockerls",
        "eslint",
        "jsonls",
        "tsserver",
        "lua_ls"
      },

      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities
          })
        end,

        ["lua_ls"] = function()
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
        end
      }
    })
  end
}
