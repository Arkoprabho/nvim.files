vim.g.mapleader = " "
local map = vim.keymap.set
-- Navigating between splits
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to split below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to split above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Diff related mappings
map("n", "<leader>R", "<CMD>diffget REMOTE<CR>", { desc = "Pull changes from remote during a split" })
map("n", "<leader>B", "<CMD>diffget BASE<CR>", { desc = "Pull changes from base during a split" })
map("n", "<leader>L", "<CMD>diffget LOCAL<CR>", { desc = "Pull changes from local during a split" })

-- Navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
