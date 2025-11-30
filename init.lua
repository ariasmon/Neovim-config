vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- lazy.nvim
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

require("lazy").setup(require("custom.plugins"))

-- 24-bit color
vim.opt.termguicolors = true

-- Binds
vim.g.mapleader = ' '

local map = vim.keymap.set

map('n', '<leader>w', ':wq<CR>', { desc = 'Guardar y salir' })

map('n', '[b', ':bprevious<CR>', { desc = 'Buffer anterior' })
map('n', ']b', ':bnext<CR>', { desc = 'Buffer siguiente' })

map('n', '<C-h>', '<C-w>h', { desc = 'Moverse al split izq' })
map('n', '<C-j>', '<C-w>j', { desc = 'Moverse al split abajo' })
map('n', '<C-k>', '<C-w>k', { desc = 'Moverse al split arriba' })
map('n', '<C-l>', '<C-w>l', { desc = 'Moverse al split der' })
map('n', '<leader>x', '<C-w>c', { desc = 'Cerrar ventana/split actual' })

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Abrir/Cerrar Explorador' })

-- RUN PYTHON

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
