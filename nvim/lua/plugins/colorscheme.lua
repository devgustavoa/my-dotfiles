return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local FG = "#f8f8f2"
    local BG = "#000000"

    require("monokai-pro").setup({
      filter = "classic",

      overridePalette = function()
        return {
          background = BG,
          dark0 = BG,
          dark1 = BG,
          dark2 = BG,
          text = FG,
        }
      end,

      override = function()
        return {
          Normal = { fg = FG, bg = BG },
          NormalNC = { fg = FG, bg = BG },
          EndOfBuffer = { fg = FG, bg = BG },
          NonText = { fg = FG, bg = BG },
          WinSeparator = { fg = FG, bg = BG },

          WhichKeyNormal = { bg = BG, fg = FG },
          WhichKeyBorder = { bg = BG, fg = BG },
          WhichKey = { bg = BG, fg = FG },
          WhichKeyGroup = { bg = BG, fg = FG },
          WhichKeyDesc = { bg = BG, fg = FG },
          WhichKeyFloat = { bg = BG, fg = FG },

          CursorLine = { bg = "#1a1a1a" },
          CursorColumn = { bg = "#1a1a1a" },
          Visual = { bg = "#2a2a2a" },

          SnacksNormal = { fg = FG, bg = BG },
          SnacksExplorerNormal = { fg = FG, bg = BG },
          SnacksExplorerFile = { fg = FG },
          SnacksExplorerDir = { fg = FG },
          SnacksExplorerIndent = { fg = FG },
          SnacksExplorerIcon = { fg = FG },
          SnacksExplorerGit = { fg = FG },
          SnacksExplorerBorder = { fg = "#ffffff", bg = BG },

          SnacksPickerNormal = { fg = FG, bg = BG },
          SnacksPickerList = { fg = FG, bg = BG },
          SnacksPickerBorder = { fg = "#ffffff", bg = BG },

          NeoTreeNormal = { fg = FG, bg = BG },
          NeoTreeNormalNC = { fg = FG, bg = BG },
          NvimTreeNormal = { fg = FG, bg = BG },
          NvimTreeNormalNC = { fg = FG, bg = BG },

          ["@text"] = { fg = FG },
          ["@text.literal"] = { fg = FG },
          ["@text.reference"] = { fg = FG },
          ["@string"] = { fg = FG },
          ["@variable"] = { fg = FG },
          ["@property"] = { fg = FG },

          Pmenu = { fg = FG, bg = BG },
          PmenuSel = { bg = "#1f1f1f" },
          PmenuSbar = { bg = BG },
          PmenuThumb = { bg = "#333333" },

          NormalFloat = { fg = FG, bg = BG },
          FloatBorder = { fg = "#ffffff", bg = BG },
        }
      end,
    })

    vim.cmd.colorscheme("monokai-pro")
  end,
}
