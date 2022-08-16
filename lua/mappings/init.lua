local map = vim.api.nvim_set_keymap
local opts = {
    noremap = true,
    silent = true
}

-- File Explorer config
map('n', '<leader>r', ':NvimTreeFindFile<CR>', opts)
map('n', '<leader>ntt', ':NvimTreeToggle<CR>', opts)


-- Terminal
map('n', '@t', ':terminal<CR>', opts)
