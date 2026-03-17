-- ====================================================================
-- BOOTSTRAP LAZY.NVIM
-- ====================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ====================================================================
-- IMPORTAR MÓDULOS
-- ====================================================================
require("custom.options")
require("custom.keymaps")
require("custom.autocmds")

-- ====================================================================
-- CARGAR PLUGINS
-- ====================================================================
require("lazy").setup({
    { import = "custom.plugins" },
    { import = "custom.themes" },
})

-- ====================================================================
-- TEMA GUARDADO
-- ====================================================================
local theme_file = vim.fn.stdpath("config") .. "/.last_theme"
local f = io.open(theme_file, "r")
if f then
    local last_theme = f:read("*all"):gsub("%s+", "")
    f:close()
    if not pcall(vim.cmd.colorscheme, last_theme) then
        vim.cmd.colorscheme "catppuccin"
    end
else
    vim.cmd.colorscheme "catppuccin"
end