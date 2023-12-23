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
