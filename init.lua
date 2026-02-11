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
vim.opt.conceallevel = 2
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

-- CONFIGURACIÓN DE PLUGINS MODIFICADA
require("lazy").setup({
  { import = "custom.plugins" },      -- Importar el plugins.lua
  { import = "custom.themes" },  -- Importar lista temas
  { import = "custom.switcher" },     -- Importar el selector en telescope
})

-- ====================================================================
-- 3. ATAJOS DE TECLADO (Keymaps)
-- ====================================================================
local map = vim.keymap.set

-- Generales
map('n', '<leader>w', '<cmd>w<CR>', { desc = 'Guardar' })
map('n', '<leader>wq', ':wq<CR>', { desc = 'Guardar y salir' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'Salir sin guardar' })
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

-- Para evitar que darle al espacio cierre la ejecucion de codigo con terminal
vim.api.nvim_create_autocmd("TermClose", {
    group = vim.api.nvim_create_augroup("TerminalConfig", { clear = true }),
    callback = function()
        vim.cmd("stopinsert")
    end,
})

-- ====================================================================
-- 4. GUARDAR ULTIMO TEMA 
-- ====================================================================
local theme_file = vim.fn.stdpath("config") .. "/.last_theme"
local f = io.open(theme_file, "r")
if f then
    local last_theme = f:read("*all"):gsub("%s+", "")
    f:close()
    -- Se intenta cargar el tema guardado, si no es posible catppuccin
    if not pcall(vim.cmd.colorscheme, last_theme) then
        vim.cmd.colorscheme "catppuccin"
    end
else
    vim.cmd.colorscheme "catppuccin"
end
