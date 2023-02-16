local set = vim.opt

set.colorcolumn = "120"
set.cmdheight = 1
set.autowrite = true
set.autowriteall = true
set.guifont = "JetBrains Mono:h15"
set.foldmethod = "indent"
set.ignorecase = true
set.foldexpr = "nvim_treesitter#foldexpr()"
set.expandtab = true
set.number = true
set.mouse = "a"
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
set.cursorline = true

set.hidden = true
set.clipboard = "unnamedplus"

vim.notify = require("notify")
vim.g.use_nerd_icons = true
