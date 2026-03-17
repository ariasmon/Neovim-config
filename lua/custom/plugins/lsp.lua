-- ====================================================================
-- LSP Y MASON
-- ====================================================================
return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "pyright",
                    "lua_ls",
                    "bashls",
                    "marksman",
                    "terraformls",
                    "tflint",
                    "yamlls",
                    "dockerls",
                    "docker_compose_language_service",
                },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = { globals = { "vim" } },
                                    workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                                    telemetry = { enable = false },
                                },
                            },
                        })
                    end,
                    ["pyright"] = function()
                        lspconfig.pyright.setup({
                            capabilities = capabilities,
                            settings = {
                                python = {
                                    analysis = {
                                        typeCheckingMode = "basic",
                                        autoSearchPaths = true,
                                        useLibraryCodeForTypes = true,
                                    },
                                },
                            },
                        })
                    end,
                },
            })

            -- ====================================================================
            -- KEYMAPS LSP
            -- ====================================================================
            local map = vim.keymap.set
            map("n", "gd", vim.lsp.buf.definition, { desc = "Ir a definición" })
            map("n", "gD", vim.lsp.buf.declaration, { desc = "Ir a declaración" })
            map("n", "gr", vim.lsp.buf.references, { desc = "Referencias" })
            map("n", "gi", vim.lsp.buf.implementation, { desc = "Implementación" })
            map("n", "K", vim.lsp.buf.hover, { desc = "Documentación" })
            map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renombrar" })
            map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Acciones de código" })
            map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Ver diagnóstico" })
            map("n", "[d", vim.diagnostic.goto_prev, { desc = "Diagnóstico anterior" })
            map("n", "]d", vim.diagnostic.goto_next, { desc = "Diagnóstico siguiente" })
            map("n", "<leader>fm", function()
                require("conform").format({ async = true, lsp_fallback = true })
            end, { desc = "Formatear código" })
        end,
    },
}