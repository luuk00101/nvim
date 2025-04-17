return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,

        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git" or name == ".DS_Store"
          end,
        },

        win_options = {
          wrap = true,
        },

        keymaps = {
          ["<C-h>"] = false,
          ["<C-c>"] = false,
          ["q"] = "actions.close",
        },
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>")
    end,
  }
}
