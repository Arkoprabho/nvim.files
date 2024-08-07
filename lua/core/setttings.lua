local set = vim.opt
local globals = vim.g

set.cmdheight = 1
set.autowrite = true
set.autowriteall = true
set.foldmethod = "expr"
set.ignorecase = true
set.foldexpr = "nvim_treesitter#foldexpr()"
set.expandtab = true
set.number = true
set.mouse = "a"
set.fillchars = { eob = " " }
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = true
set.scrolloff = 5
set.fileencoding = "utf-8"
set.termguicolors = true
set.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

set.relativenumber = true
set.cursorline = false

set.hidden = true
set.clipboard = "unnamedplus"

set.spelllang = "en_us"
set.spell = true

vim.notify = require("notify")
globals.editorconfig = true
globals.use_nerd_icons = true
