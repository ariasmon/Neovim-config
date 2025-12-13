return {
  -- ====================================================================
  -- TEMA (Catppuccin)
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
  -- EXPLORADOR DE ARCHIVOS (NVIMTREE)
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
  -- SINTAXIS AVANZADA (TREESITTER)
  -- ====================================================================
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "python", "lua", "vim", "html", "css" },
        highlight = { enable = true },
      }
    end
  },

  -- ====================================================================
  -- AUTOCOMPLETADO (CMP) - ¡NUEVO!
  -- ====================================================================
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',     -- Fuente de datos del LSP
      'L3MON4D3/LuaSnip',         -- Motor de snippets
      'saadparwaiz1/cmp_luasnip'  -- Conector de snippets
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),     -- Abrir menú manualmente
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter para confirmar
          ['<Tab>'] = cmp.mapping(function(fallback)  -- Tab para bajar
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
  -- LSP, MASON Y FORMATO (Conectado con CMP)
  -- ====================================================================
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()

      -- Importante: Conexión con el autocompletado
      -- Esto le dice al LSP que tenemos un plugin (cmp) capaz de recibir sugerencias
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require('mason-lspconfig').setup({
        ensure_installed = { "pyright", "lua_ls" },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({
              -- Añadimos capabilities aquí para activar el autocompletado inteligente
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
}
