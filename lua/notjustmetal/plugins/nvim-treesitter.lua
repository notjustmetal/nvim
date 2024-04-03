return {
  "nvim-treesitter/nvim-treesitter",

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c_sharp",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "sql",
        "terraform",
        "typescript",
        "vim",
        "yaml"
      },

      auto_install = true,

      highlight = {
        enable = true
      },

      indent = {
        enable = true
      }
    })
  end
}
