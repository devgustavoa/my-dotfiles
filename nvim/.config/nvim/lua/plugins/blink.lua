return {
  "saghen/blink.cmp",

  -- Downloads pre-built release binaries instead of building locally from source
  version = "*",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  ---@module "blink.cmp"
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
    },

    completion = {
      documentation = {
        auto_show = true,
      },
    },

    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },

    fuzzy = {
      implementation = "prefer_rust",
    },
  },
}
