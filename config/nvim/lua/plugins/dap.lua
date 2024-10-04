return {
  "mfussenegger/nvim-dap",
  event = "BufRead",
  optional = true,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio",
    {
      "williamboman/mason.nvim",
      opts = { ensure_installed = { "java-debug-adapter", "java-test" } },
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dap.adapters.lldb = {
      type = "executable",
      command = "/opt/homebrew/opt/llvm/bin/lldb-dap", -- adjust as needed, must be absolute path
      name = "lldb",
    }

    local lldb = {
      name = "Launch lldb",
      type = "lldb", -- matches the adapter
      request = "launch", -- could also attach to a currently running process
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    }

    dap.configurations.rust = {
      lldb,
    }

    dapui.setup()
  end,
}
