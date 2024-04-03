return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "rcarriga/nvim-notify"
  },

  config = function()
    local builtin = require("telescope.builtin")
    local extensions = require("telescope").extensions

    local keymap = vim.keymap

    keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [f]ile" })
    keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ile [g]rep" })
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [b]uffer" })
    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [h]elp" })
    keymap.set("n", "<leader>fn", function() extensions.notify.notify() end, { desc = "[F]ind [n]otifications" })
  end
}
