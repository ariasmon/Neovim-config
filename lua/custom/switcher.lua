return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Abrir con t+h 
      vim.keymap.set("n", "<leader>th", function()
        require("telescope.builtin").colorscheme({ 
          enable_preview = true,
          ignore_builtins = true 
        })
      end, { desc = "Selector de Temas" })

      -- Autoguardado de tema seleccionado
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          local theme = vim.g.colors_name
          local file = io.open(vim.fn.stdpath("config") .. "/.last_theme", "w")
          if file then
            file:write(theme)
            file:close()
          end
        end,
      })
    end,
  },
}
