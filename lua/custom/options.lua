-- ====================================================================
-- OPCIONES BÁSICAS DE VIM
-- ====================================================================
local opt = vim.opt
local g = vim.g

g.mapleader = " "

opt.nu = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.conceallevel = 2
opt.clipboard = "unnamedplus"
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.hlsearch = true
opt.incsearch = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.updatetime = 50
opt.colorcolumn = "80"
opt.cursorline = true
opt.splitbelow = true
opt.splitright = true