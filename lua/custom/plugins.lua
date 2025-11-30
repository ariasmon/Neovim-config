return {
-- THEME "Catppuccin"
{
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,          
    priority = 1000,       
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha' 
    end
  },
-- Plugin NVIMTREE
{
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup {
        view = {
          width = 30,
        },
      }
  end
  },

-- Plugin TreeSitter
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
-- LSP & Format
{
    'neovim/nvim-lspconfig',
    dependencies = { 
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    }, 
    config = function()
      require('mason').setup()
      
      require('lspconfig').pyright.setup({})

      -- ATAJOS de LSP (en Modo Normal 'n')
      local map = vim.keymap.set
      
      -- Ir a la definicion del simbolo (donde se declaro)
      map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
      
      -- Mostrar documentacion flotante
      map('n', 'K', vim.lsp.buf.hover, { desc = 'Mostrar documentacion' })
      
      -- NOTA: Por ahora esto no funcionara, pero define el atajo
      map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Formatear buffer' })
    end
  },
}
