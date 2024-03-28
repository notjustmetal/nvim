return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    
    require("nvim-tree").setup({
      actions = {
        change_dir = {
          restrict_above_cwd = true,
        },
      },
      
      renderer = {
        root_folder_label = function(root_path)
          -- Extract the last part of the path
          local folder_name = root_path:match("^.+/(.+)$")
          return folder_name or root_path
        end,

        icons = {
          git_placement = "after",
          
          glyphs = {
            git = {
              unstaged = "●",
              staged = "✚",
              unmerged = "✖",
              renamed = "➜",
              untracked = "✭",
              deleted = "✖",
              ignored = "◌"
            },
          },

          show = {
            folder_arrow = false
          }
        }
      }
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File [E]xplorer" })
  end
}
