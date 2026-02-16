return {
  {
    "ficcdaf/ashen.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = {
        bold = false,
        italic = false,
      },
      transparent = false,
      colors = {
        background = "#000000",
      },
    },
    config = function(_, opts)
      require("ashen").setup(opts)
      vim.cmd.colorscheme("ashen")
    end,
  },
  {
    "datsfilipe/vesper.nvim",
  },
}
