return {
  {
    "echasnovski/mini.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("mini.statusline").setup({ use_icons = true })
      require("mini.ai").setup()
      require("mini.surround").setup()
    end,
  }
}
