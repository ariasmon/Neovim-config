-- ====================================================================
-- KEYMAPS GLOBALES
-- ====================================================================
local map = vim.keymap.set

-- ====================================================================
-- GENERALES
-- ====================================================================
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar" })
map("n", "<leader>wq", ":wq<CR>", { desc = "Guardar y salir" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Salir sin guardar" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Limpiar resaltado" })

-- ====================================================================
-- BUFFERS
-- ====================================================================
map("n", "[b", ":bprevious<CR>", { desc = "Buffer anterior" })
map("n", "]b", ":bnext<CR>", { desc = "Buffer siguiente" })
map("n", "<leader>bd", ":bd<CR>", { desc = "Cerrar buffer" })

-- ====================================================================
-- SPLITS
-- ====================================================================
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<leader>x", "<C-w>c", { desc = "Cerrar ventana" })

-- ====================================================================
-- NVIMTREE
-- ====================================================================
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Abrir Explorador" })

-- ====================================================================
-- COMENTARIOS
-- ====================================================================
map("n", "gcc", "<Plug>(comment_toggle_linewise)", { desc = "Comentar línea" })
map("n", "gbc", "<Plug>(comment_toggle_blockwise)", { desc = "Comentar bloque" })
map("v", "gc", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comentar selección" })
map("v", "gb", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Comentar selección bloque" })

-- ====================================================================
-- FLASH (MOVIMIENTOS)
-- ====================================================================
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })

-- ====================================================================
-- TROUBLE (DIAGNÓSTICOS)
-- ====================================================================
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Trouble: diagnósticos" })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Trouble: documento" })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Trouble: workspace" })
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Trouble: quickfix" })

-- ====================================================================
-- GIT
-- ====================================================================
map("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", { desc = "Siguiente cambio" })
map("n", "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Anterior cambio" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame línea" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff" })

-- ====================================================================
-- MEJORAS DE EDICIÓN
-- ====================================================================
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover línea abajo" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover línea arriba" })
map("n", "J", "mzJ`z", { desc = "Juntar líneas sin mover cursor" })
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll abajo centrado" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll arriba centrado" })
map("n", "n", "nzzzv", { desc = "Siguiente búsqueda centrado" })
map("n", "N", "Nzzzv", { desc = "Anterior búsqueda centrado" })

-- ====================================================================
-- EJECUTAR ARCHIVO
-- ====================================================================
local function RunCurrentFile()
    vim.cmd("w")
    if vim.bo.filetype == "python" then
        vim.cmd("split term://python " .. vim.fn.expand("%"))
    elseif vim.bo.filetype == "lua" then
        vim.cmd("split term://lua " .. vim.fn.expand("%"))
    else
        print("Ejecución no soportada para este archivo.")
    end
end
map("n", "<leader>r", RunCurrentFile, { desc = "Ejecutar archivo" })