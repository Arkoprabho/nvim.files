local set = vim.opt
local globals = vim.g

set.cmdheight = 1
set.autowrite = true
set.autowriteall = true
set.foldmethod = "expr"
set.ignorecase = true
set.foldexpr = "v:lua.vim.treesitter.foldexpr()"
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

set.relativenumber = true
set.cursorline = false

set.hidden = true
set.clipboard = "unnamedplus"

set.spelllang = "en_us"
set.spell = true

globals.editorconfig = true
globals.use_nerd_icons = true

-- Abbreviations
vim.cmd([[
inoreabbrev seperate separate
inoreabbrev ture true
inoreabbrev flase false
cabbrev Wq wq
cabbrev Wa wa
cabbrev Qa qa
cabbrev Q q
cabbrev LWq wq
cabbrev Lw w
cabbrev Lq q
cabbrev git Git
]])
