-- ====================================================================
-- PLUGINS PRINCIPALES
-- ====================================================================
return {
    -- ====================================================================
    -- UI/INTERFAZ
    -- ====================================================================
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                component_separators = "|",
                section_separators = "",
            },
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        opts = {
            view = { width = 30 },
            renderer = { group_empty = true },
            filters = { dotfiles = false },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "VeryLazy",
        opts = {
            indent = { char = "│" },
            scope = { enabled = true },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "TroubleToggle", "Trouble" },
        opts = {},
    },

-- ====================================================================
    -- NAVEGACIÓN Y BÚSQUEDA
    -- ====================================================================
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Buscar Archivos" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Buscar Texto" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buscar en Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Buscar Ayuda" },
            { "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Archivos recientes" },
            {
                "<leader>th",
                function()
                    require("telescope.builtin").colorscheme({ enable_preview = true })
                end,
                desc = "Selector de Temas",
            },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- ====================================================================
    -- ÁRBOL DE SINTAXIS
    -- ====================================================================
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = {
                "python", "lua", "vim", "html", "css", "javascript",
                "bash", "markdown", "markdown_inline", "terraform",
                "hcl", "dockerfile", "yaml", "json", "toml",
            },
            highlight = { enable = true },
            indent = { enable = true },
        },
    },

    -- ====================================================================
    -- AUTOPAIRS
    -- ====================================================================
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -- ====================================================================
    -- SURROUND
    -- ====================================================================
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        opts = {},
    },

    -- ====================================================================
    -- COMENTARIOS
    -- ====================================================================
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- ====================================================================
    -- GIT
    -- ====================================================================
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    -- ====================================================================
    -- FORMATEO
    -- ====================================================================
    {
        "stevearc/conform.nvim",
        event = "VeryLazy",
        opts = {
            formatters_by_ft = {
                python = { "black" },
                lua = { "stylua" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                json = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                terraform = { "terraform_fmt" },
                hcl = { "terraform_fmt" },
                yaml = { "yamlfmt" },
                markdown = { "prettier" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
    },

    -- ====================================================================
    -- MARKDOWN
    -- ====================================================================
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        ft = { "markdown" },
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" },
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        ft = { "markdown" },
        opts = {
            render_modes = { "n", "c", "t", "v", "V" },
            heading = {
                sign = false,
                icons = { "󰲡", "󰲣", "󰲥", "󰲧", "󰲩", "󰲫" },
            },
        },
    },

    -- ====================================================================
    -- DEVOPS
    -- ====================================================================
    {
        "towolf/vim-helm",
        ft = "helm",
    },
    {
        "hashivim/vim-terraform",
        ft = { "terraform", "hcl" },
        config = function()
            vim.g.terraform_fmt_on_save = 1
        end,
    },
}