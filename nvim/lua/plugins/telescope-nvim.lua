-- Fuzzy finder
return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  opts = {
    defaults = {
      layout_config = {
        vertical = {
          width = 0.75,
        },
      },
      path_display = {
        filename_first = {
          reverse_directories = true,
        },
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    local lsp_util = vim.lsp.util
    local original_show_document = lsp_util.show_document

    rawset(lsp_util, "show_document", function(location, encoding, opts_)
      local ok = pcall(original_show_document, location, encoding, opts_)
      if not ok then
        vim.notify("LSP returned an invalid location (cursor out of range)", vim.log.levels.WARN)
      end
    end)
  end,
}
