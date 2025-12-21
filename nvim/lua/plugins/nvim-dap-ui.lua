-- lua/plugins/dap-ui.lua
return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      ---------------------------------------------------------------------------
      -- UI lifecycle: open/close automatically with the debugger
      ---------------------------------------------------------------------------
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      ---------------------------------------------------------------------------
      -- Breakpoint & stopped signs
      ---------------------------------------------------------------------------
      vim.fn.sign_define("DapBreakpoint", {
        text = "⚪",
        texthl = "DapBreakpointSymbol",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      })

      vim.fn.sign_define("DapStopped", {
        text = "🔴",
        texthl = "yellow",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
        text = "⭕",
        texthl = "DapStoppedSymbol",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
      })

      ---------------------------------------------------------------------------
      -- dap-ui setup (minimal, scopes-focused layout)
      ---------------------------------------------------------------------------
      dapui.setup({
        expand_lines = true,
        controls = {
          enabled = false,
        },
        floating = {
          border = "rounded",
        },
        render = {
          max_type_length = 60,
          max_value_lines = 200,
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 1.0 },
            },
            size = 15,
            position = "bottom",
          },
        },
      })

      ---------------------------------------------------------------------------
      -- Keymaps
      ---------------------------------------------------------------------------
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "<leader>Du", function()
        dapui.toggle()
      end, vim.tbl_extend("force", opts, { desc = "Toggle DAP UI" }))

      map({ "n", "v" }, "<leader>Dw", function()
        dapui.eval(nil, { enter = true })
      end, vim.tbl_extend("force", opts, { desc = "Add expression to Watches" }))

      map(
        { "n", "v" },
        "Q",
        function()
          dapui.eval()
        end,
        vim.tbl_extend("force", opts, {
          desc = "Hover/eval value (small floating window)",
        })
      )
    end,
  },
}
