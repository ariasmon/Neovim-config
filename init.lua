-- ====================================================================
-- 1. OPCIONES BÁSICAS
-- ====================================================================
vim.g.mapleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus" 

-- ====================================================================
-- 2. LAZY.NVIM BOOTSTRAP
-- ====================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Cargar Plugins
require("lazy").setup(require("custom.plugins"))

-- ====================================================================
-- 3. ATAJOS DE TECLADO (Keymaps)
-- ====================================================================
local map = vim.keymap.set

-- Generales
map('n', '<leader>w', ':wq<CR>', { desc = 'Guardar y salir' })
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Limpiar resaltado' })

-- Buffers
map('n', '[b', ':bprevious<CR>', { desc = 'Buffer anterior' })
map('n', ']b', ':bnext<CR>', { desc = 'Buffer siguiente' })

-- Splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<leader>x', '<C-w>c', { desc = 'Cerrar ventana' })

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Abrir Explorador' })

-- Ejecutar Archivo Actual
local function RunCurrentFile()
    vim.cmd("w")
    if vim.bo.filetype == 'python' then
        vim.cmd("split term://python " .. vim.fn.expand("%"))
    elseif vim.bo.filetype == 'lua' then
        vim.cmd("split term://lua " .. vim.fn.expand("%"))
    else
        print("Ejecución no soportada para este archivo.")
    end
end
vim.keymap.set('n', '<leader>r', RunCurrentFile, { desc = 'Ejecutar archivo' })
