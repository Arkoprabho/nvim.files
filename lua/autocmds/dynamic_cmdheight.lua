vim.api.nvim_create_autocmd("CmdlineEnter", {
    callback = function()
        vim.opt.cmdheight = 1
    end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
    callback = function()
        vim.defer_fn(function()
            vim.opt.cmdheight = 0
        end, 1)
    end,
})
