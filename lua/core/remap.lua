vim.g.mapleader = "\\"

local map = vim.keymap.set

-- Navigation
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Splits
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-w>z", "<Cmd>WindowsMaximize<CR>")
