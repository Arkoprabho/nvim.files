local set = vim.opt
set.foldmethod = "expr"
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
set.wrap = false
set.scrolloff = 10
set.fileencoding = "utf-8"
set.termguicolors = true

set.relativenumber = true
set.cursorline = true

set.hidden = true
set.clipboard = "unnamedplus"

vim.notify = require("notify")
