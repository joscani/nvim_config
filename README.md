# nvim_config
Archivos de configuracion de nvim

## Intro

Voy a compartir mis ficheros de configuración de Neovim. 
Aprovecho que he hecho una reinstalación bastante limpia de mi sistema linux y que he borrado la config de mi Neovim

Siguiendo los consejos de este [libro](https://www.amazon.com/Neovim-beginners-complete-installation-fully-fledged-ebook/dp/B0CCW8PGKV) voy a ordenar mis archivos de configuración `*.lua` de 
forma que sea más modular y limpio. 


## Requisitos

* Neovim de versión superior a la 8. Yo tngo la 10
* El contenido de la carpeta `nvim` ha de estar en `~/.config/nvim`

Al ejecutar `tree -L 2 nvim` en el directorio `~/.config` 

```
nvim
├── init.lua
└── lua
    └── user
        ├── init.lua
        ├── keymaps.lua
        └── options.lua
```

## Plugin manager

Yo usaba `Packervim` pero se ha descontinuado, así que ahora uso [`lazy.nvim`](https://github.com/folke/lazy.nvim) 

Para instalarlo simplemente pon esto en tu `.config/nvim/ini.lua`

```
-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
```

Puedes ver mi `init.lua` . 
En `.config/nvim/lua/user/plugins`  he puesto algunos plugings

```
-- First config for lazyvim, https://github.com/folke/neodev.nvim
return {
  "folke/neodev.nvim",
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  { 'jalvesaq/Nvim-R', lazy = false },
}
```

Y se cargan en el `init.lua` principal con 

```
require("lazy").setup("user.plugins")
```

## Nvim-R 

Yo soy usuario de R así que uno de los primeros plugins que pongo es el de Nvim-R, y 
he puesto algunas opciones en `.config/nvim/lua/user/nvim_r_opt.lua`

Estas opciones son para usar Ctrl + Espacio en modo normal  y visual para ejecutra una línea
o en modo insert pulsar `jk` . También para iniciar la consola de R y el visor de objetos
de forma automática si se abre un fichero *.R 



```
-- shortcuts
vim.cmd("nmap <C-Space> <Plug>RDSendLine")
vim.cmd("vmap <C-Space> <Plug>RDSendSelection")
vim.cmd("imap jk <Esc>:call SendLineToR('stay')<CR><Down><Home>i")

-- init options

vim.g.R_auto_start = 1
vim.g.R_objbr_auto_start = 1
vim.g.R_start_libs = 'base,stats,graphics,grDevices,utils,methods'
vim.g.R_objbr_place = 'console,above'
vim.g.R_editor_w = 30
vim.g.R_show_args = 1
```
