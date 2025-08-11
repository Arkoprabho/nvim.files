local fugitive = {
    "tpope/vim-fugitive",
    commit = "61b51c09b7c9ce04e821f6cf76ea4f6f903e3cf4",
    cmd = { "Git" },
    config = function()
        local map = vim.api.nvim_set_keymap
        local opts = {
            noremap = true,
            silent = true,
        }
        map("n", "<leader>gc", "<CMD>Git commit<CR>", opts)
        map("n", "<leader>gp", "<CMD>Git! push<CR>", opts)
        map("n", "<leader>cnv", "<CMD>Git commit --no-verify<CR>", opts)
    end
}

return {
    fugitive
}
