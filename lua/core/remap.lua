vim.g.mapleader = " "

local map = vim.keymap.set

-- Navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Splits
map("n", "<C-w>z", "<Cmd>WindowsMaximize<CR>")
