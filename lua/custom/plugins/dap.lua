-- ====================================================================
-- DEBUGGING (DAP)
-- ====================================================================
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap-python",
        },
        keys = {
            { "<F5>", function() require("dap").continue() end, desc = "Debug: Iniciar" },
            { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
            { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
            { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
            { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Breakpoint" },
            { "<leader>B", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Condición: ")) end, desc = "Debug: Breakpoint condicional" },
            { "<leader>dr", function() require("dap").repl.open() end, desc = "Debug: REPL" },
            { "<leader>du", function() require("dapui").toggle() end, desc = "Debug: UI" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()

            local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)

            vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "DapStopped", linehl = "Visual", numhl = "" })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.after.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.after.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
}