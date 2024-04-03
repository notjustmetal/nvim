return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),

      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "<leader>caf", function()
            vim.lsp.buf.format({ async = true })
          end,
          opts)
      end
    })
  end
}
