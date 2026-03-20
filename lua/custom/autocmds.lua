-- ====================================================================
-- AUTOCOMANDOS
-- ====================================================================
local augroup = vim.api.nvim_create_augroup

-- ====================================================================
-- TERMINAL
-- ====================================================================
vim.api.nvim_create_autocmd("TermClose", {
    group = augroup("TerminalConfig", { clear = true }),
    callback = function()
        vim.cmd("stopinsert")
    end,
})

-- ====================================================================
-- RESALTAR AL COPIAR
-- ====================================================================
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("HighlightYank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- ====================================================================
-- AUTOCOMANDOS PARA ARCHIVOS ESPECÍFICOS
-- ====================================================================
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.opt_local.wrap = true
    end,
})

-- ====================================================================
-- GUARDAR TEMA
-- ====================================================================
vim.api.nvim_create_autocmd("ColorScheme", {
    group = augroup("SaveTheme", { clear = true }),
    callback = function()
        local theme = vim.g.colors_name
        if theme then
            local file = io.open(vim.fn.stdpath("config") .. "/.last_theme", "w")
            if file then
                file:write(theme)
                file:close()
            end
        end
    end,
})