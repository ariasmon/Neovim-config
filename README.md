#Configuración de Neovim

## Requisitos generales

Se recomienda tener instaladas las siguientes herramientas para asegurar el funcionamiento de los plugins y el debugger:
* git, curl, unzip, gcc, make
* python3-venv (necesario para el funcionamiento del debugger)
* [Nerd Font](https://www.nerdfonts.com/) instalada en tu terminal (para ver los iconos).
* Un gestor de portapapeles

### Formateadores (opcional pero recomendado)
```bash
# Python
pip install black

# Lua
cargo install stylua

# JavaScript/JSON/HTML/CSS
npm install -g prettier

# YAML
go install github.com/google/yamlfmt/cmd/yamlfmt@latest

# O desde Neovim:
# :MasonInstall black stylua prettier yamlfmt
```

---

## Estructura de archivos

```
~/.config/nvim/
├── init.lua                    # Bootstrap y requires
├── lazy-lock.json              # versiones de plugins
└── lua/custom/
    ├── options.lua             # Opciones de vim
    ├── keymaps.lua             # Atajos de teclado
    ├── autocmds.lua            # Autocomandos
    ├── plugins/
    │   ├── init.lua            # Plugins principales
    │   ├── lsp.lua              # LSP y Mason
    │   ├── cmp.lua              # Autocompletado
    │   └── dap.lua              # Debugging
    └── themes.lua              # Lista de temas
```

---

## Plugins Instalados

### Interfaz
* **which-key**: Muestra atajos disponibles
* **lualine**: Barra de estado
* **nvim-tree**: Explorador de archivos lateral
* **nvim-web-devicons**: Iconos de interfaz
* **indent-blankline**: Guías de indentación
* **todo-comments**: Resalta TODO/FIXME/NOTE
* **trouble**: Lista de diagnósticos

### Navegación y Búsqueda
* **telescope**: Buscador de archivos y texto
* **flash**: Movimientos rápidos en código
* **nvim-tree**: Explorador de archivos

### Desarrollo y Autocompletado
* **treesitter**: Resaltado de sintaxis avanzado
* **nvim-cmp**: Motor de autocompletado
* **LuaSnip**: Snippets
* **lspconfig**: Configuración de servidores de lenguaje
* **mason**: Gestión de instalación de LSPs y Debuggers
* **conform**: Formateo de código
* **lspkind**: Iconos en autocompletado

### Edición
* **nvim-autopairs**: Cierre automático de paréntesis y llaves
* **nvim-surround**: Manipular surrounds (paréntesis, comillas)
* **Comment.nvim**: Comentar código

### Git
* **gitsigns**: Ver cambios de git en la barra lateral

### Depuración
* **nvim-dap**: Herramientas de depuración
* **nvim-dap-ui**: Interfaz visual para DAP
* **nvim-dap-python**: Soporte Python para DAP

### DevOps
* **vim-terraform**: Soporte para archivos .tf y .hcl
* **vim-helm**: Soporte para plantillas de Kubernetes

### Markdown
* **markdown-preview**: Previsualización en navegador
* **render-markdown**: Renderizado estético en Neovim

---

## Atajos de Teclado (Leader = Espacio)

### Sistema y Navegación

| Atajo | Acción |
| --- | --- |
| `<leader>w` | Guardar archivo |
| `<leader>wq` | Guardar y salir |
| `<leader>q` | Salir sin guardar |
| `<leader>x` | Cerrar ventana o split actual |
| `<C-h/j/k/l>` | Moverse entre splits |
| `[b` / `]b` | Buffer anterior / siguiente |
| `<leader>bd` | Cerrar buffer |
| `<Esc>` | Limpiar resaltado de búsqueda |
| `<leader>e` | Abrir/cerrar explorador de archivos |

### Búsqueda (Telescope)

| Atajo | Acción |
| --- | --- |
| `<leader>ff` | Buscar archivos por nombre |
| `<leader>fg` | Buscar texto en archivos (Grep) |
| `<leader>fb` | Buscar entre buffers abiertos |
| `<leader>fh` | Buscar en la ayuda de Neovim |
| `<leader>fo` | Archivos recientes |

### Desarrollo y LSP

| Atajo | Acción |
| --- | --- |
|`<leader>r` | Ejecutar archivo actual (Python/Lua) |
| `gd` | Ir a la definición |
| `gD` | Ir a la declaración |
| `gr` | Ver referencias |
| `gi` | Ver implementación |
| `K` | Ver documentación (Hover) |
| `<leader>rn` | Renombrar variable |
| `<leader>ca` | Acciones de código |
| `<leader>d` | Ver error o diagnóstico |
| `[d` / `]d` | Diagnóstico anterior / siguiente |
| `<leader>fm` | Formatear código |

### Git (Gitsigns)

| Atajo | Acción |
| --- | --- |
| `<leader>gn` | Siguiente cambio (hunk) |
| `<leader>gp` | Anterior cambio (hunk) |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gS` | Stage buffer completo |
| `<leader>gu` | Undo stage |
| `<leader>gR` | Reset buffer completo |
| `<leader>gb` | Blame línea |
| `<leader>gd` | Diff |

### Depuración (DAP)

| Atajo | Acción |
| --- | --- |
| `<leader>b` | Poner/quitar breakpoint |
| `<leader>B` | Breakpoint condicional |
| `<F5>` | Iniciar/continuar depuración |
| `<F10>` | Step Over |
| `<F11>` | Step Into |
| `<F12>` | Step Out |
| `<leader>dr` | Abrir REPL |
| `<leader>du` | Toggle UI |

### Trouble (Diagnósticos)

| Atajo | Acción |
| --- | --- |
| `<leader>xx` | Toggle Trouble |
| `<leader>xd` | Diagnósticos del documento |
| `<leader>xw` | Diagnósticos del workspace |
| `<leader>xq` | Quickfix |

### Comentar

| Atajo | Acción |
| --- | --- |
| `gcc` | Comentar línea |
| `gbc` | Comentar bloque |
| `gc` (visual) | Comentar selección |

### Flash (Movimientos)

| Atajo | Acción |
| --- | --- |
| `s` | Flash jump |
| `S` | Flash Treesitter |

### Surround

| Comando | Acción |
| --- | --- |
| `ys{motion}{char}` | Añadir surround |
| `ds{char}` | Eliminar surround |
| `cs{old}{new}` | Cambiar surround |

### Edición

| Atajo | Acción |
| --- | --- |
| `J` (visual) | Mover línea abajo |
| `K` (visual) | Mover línea arriba |
| `<C-d>` | Scroll abajo centrado |
| `<C-u>` | Scroll arriba centrado |

### Temas

| Atajo | Acción |
| --- | --- |
| `<leader>th` | Abrir selector de temas |

---

## Comandos útiles

| Comando | Descripción |
| --- | --- |
| `:Mason` | Abrir gestor de LSPs/formateadores |
| `:Lazy` | Abrir gestor de plugins |
| `:checkhealth` | Verificar estado de Neovim |
| `:TSInstall <lenguaje>` | Instalar parser de Treesitter |
| `:ConformInfo` | Info de formateadores disponibles |
