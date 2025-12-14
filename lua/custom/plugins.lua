return {
  -- ====================================================================
  -- 1. TEMA (Catppuccin)
  -- ====================================================================
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end
  },

  -- ====================================================================
  -- 2. LUALINE
  -- ====================================================================
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin',
          component_separators = '|',
          section_separators = '',
        },
      })
    end
  },

  -- ====================================================================
  -- 3. NVIMTREE
  -- ====================================================================
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        view = { width = 30 },
      }
    end
  },

  -- ====================================================================
  -- 4. TELESCOPE 
  -- ====================================================================
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      -- Atajos de teclado para buscar
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Buscar Archivos' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Buscar Texto en Proyecto' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buscar en Buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Buscar Ayuda' })
    end
  },

  -- ====================================================================
  -- 5. TREESITTER 
  -- ====================================================================
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "python", "lua", "vim", "html", "css", "javascript", "bash", "markdown", "markdown_inline" },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end
  },

  -- ====================================================================
  -- 6. UTILIDADES: AUTOPAIRS 
  -- ====================================================================
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  -- ====================================================================
  -- 7. AUTOCOMPLETADO (CMP)
  -- ====================================================================
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',     -- Fuente de datos del LSP
      'L3MON4D3/LuaSnip',         -- Motor de snippets
      'saadparwaiz1/cmp_luasnip', -- Conector de snippets
      'rafamadriz/friendly-snippets', -- Colección de snippets útiles
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      -- Cargar snippets estilo VSCode
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),      -- Abrir menú manualmente
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter para confirmar
          ['<Tab>'] = cmp.mapping(function(fallback)   -- Tab para bajar
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback) -- Shift+Tab para subir
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' }, -- Fuente: Servidor de lenguaje
          { name = 'luasnip' },  -- Fuente: Snippets
        },
      })
    end
  },

  -- ====================================================================
  -- 8. LSP, MASON Y FORMATO
  -- ====================================================================
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()

      -- Conexion autocompletado 
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason-lspconfig').setup({
        ensure_installed = { "pyright", "lua_ls", "bashls", "marksman" },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({
              capabilities = capabilities
            })
          end,
        },
      })

      -- ATAJOS de LSP
      local map = vim.keymap.set
      map('n', 'gd', vim.lsp.buf.definition, { desc = 'Ir a la definición' })
      map('n', 'K', vim.lsp.buf.hover, { desc = 'Ver documentación' })
      map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Renombrar variable' })
      map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Ver error/diagnóstico' })
      map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Formatear código' })
    end
  },


  -- ====================================================================
  -- 9. MARKDOWN PREVIEW
  -- ====================================================================
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" },
    },
  }
}
