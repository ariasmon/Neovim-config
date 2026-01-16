# Configuracion de Neovim

## Requisitos generales

Se recomienda tener instaladas las siguientes herramientas para asegurar el funcionamiento de los plugins y el debugger:
* git, curl, unzip, gcc, make
* python3-venv (necesario para el funcionamiento del debugger)
* Un gestor de portapapeles

---

## Plugins Instalados

### Interfaz
* Selector de tema con Telescope.
* Lualine: Barra de estado.
* Nvim-web-devicons: Iconos de interfaz.

### Navegacion y Busqueda
* Nvim-Tree: Explorador de archivos lateral.
* Telescope: Buscador de archivos y texto.

### Desarrollo y Autocompletado
* Treesitter: Resaltado de sintaxis avanzado.
* Nvim-cmp: Motor de autocompletado y snippets.
* LSPConfig: Configuracion de servidores de lenguaje.
* Mason: Gestion de instalacion de LSPs y Debuggers.
* Nvim-autopairs: Cierre automatico de parentesis y llaves.

### Depuracion y Herramientas
* Nvim-DAP: Herramientas de depuracion para Python.
* Vim-Terraform: Soporte para archivos .tf y .hcl.
* Vim-Helm: Soporte para plantillas de Kubernetes.
* Markdown-Preview: Previsualizacion de Markdown en el navegador.

---

## Atajos de Teclado (Leader = Espacio)

### 1. Sistema y Navegacion

| Atajo | Accion |
| --- | --- |
| <leader>w | Guardar archivo |
| <leader>wq | Guardar y salir |
| <leader>q | Salir sin guardar |
| <leader>x | Cerrar ventana o split actual |
| <C-h/j/k/l> | Moverse entre splits (izq, abajo, arriba, der) |
| [b / ]b | Buffer anterior / siguiente |
| Esc | Limpiar resaltado de busqueda |
| <leader>e | Abrir o cerrar explorador de archivos |

### 2. Busqueda (Telescope)

| Atajo | Accion |
| --- | --- |
| <leader>ff | Buscar archivos por nombre |
| <leader>fg | Buscar texto en archivos (Grep) |
| <leader>fb | Buscar entre buffers abiertos |
| <leader>fh | Buscar en la ayuda de Neovim |
| <leader>th | Abrir selector temas |

### 3. Desarrollo y LSP

| Atajo | Accion |
| --- | --- |
| <leader>r | Ejecutar archivo actual (Python o Lua) |
| gd | Ir a la definicion del codigo |
| K | Ver documentacion (Hover) |
| <leader>rn | Renombrar variable en el archivo |
| <leader>d | Ver error o diagnostico |
| <leader>f | Formatear codigo automaticamente |
| <leader>mp | Previsualizar Markdown en el navegador |

### 4. Depuracion (DAP)

| Atajo | Accion |
| --- | --- |
| <leader>b | Poner o quitar punto de interrupcion (Breakpoint) |
| F5 | Iniciar depuracion o continuar |
| F10 | Siguiente paso (Step Over) |
| F11 | Entrar en funcion (Step Into) |

### 5. Edicion

| Atajo | Accion |
| --- | --- |
| > | Indentar a la derecha (mantiene seleccion) |
| < | Indentar a la izquierda (mantiene seleccion) |
| yy | Copiar linea actual |
| p | Pegar despues del cursor |
