-- ====================================================================
-- 1. OPCIONES BÁSICAS Y LEADER
-- ====================================================================
vim.g.mapleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true -- Necesario para Catppuccin

-- ====================================================================
-- 2. LAZY.NVIM BOOTSTRAP
-- ====================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Cargar Plugins desde lua/custom/plugins.lua
require("lazy").setup(require("custom.plugins"))

-- ====================================================================
-- 4. ATAJOS DE TECLADO (Keymaps)
-- ====================================================================
local map = vim.keymap.set

-- Comandos básicos
map('n', '<leader>w', ':wq<CR>', { desc = 'Guardar y salir' })

-- Navegación de Buffers
map('n', '[b', ':bprevious<CR>', { desc = 'Buffer anterior' })
map('n', ']b', ':bnext<CR>', { desc = 'Buffer siguiente' })

-- Navegación de Ventanas (Splits)
map('n', '<C-h>', '<C-w>h', { desc = 'Moverse al split izq' })
map('n', '<C-j>', '<C-w>j', { desc = 'Moverse al split abajo' })
map('n', '<C-k>', '<C-w>k', { desc = 'Moverse al split arriba' })
map('n', '<C-l>', '<C-w>l', { desc = 'Moverse al split der' })
map('n', '<leader>x', '<C-w>c', { desc = 'Cerrar ventana/split actual' })

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Abrir/Cerrar Explorador' })

-- Función de ejecución (Runner)
local function RunCurrentFile()
    vim.cmd("w")
    if vim.bo.filetype == 'python' then
        vim.cmd("split term://python " .. vim.fn.expand("%"))
    elseif vim.bo.filetype == 'lua' then
        vim.cmd("split term://lua " .. vim.fn.expand("%"))
    else
        print("Tipo de archivo no soportado para ejecucion rapida.")
    end
end

vim.keymap.set('n', '<leader>r', RunCurrentFile, { desc = 'Ejecutar archivo actual' })
