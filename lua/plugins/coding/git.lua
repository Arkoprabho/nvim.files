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
    end,
}

local gitsigns = {
    "lewis6991/gitsigns.nvim",
    version = "v1.0.2",
    keys = {
        { "<leader>g", desc = "Refresh gitsigns and attach to buffer" },
    },
    cond = function()
        -- Check if current directory is a git repo
        return vim.fn.isdirectory(".git") == 1 or vim.fn.system("git rev-parse --git-dir"):find("^%.git") ~= nil
    end,
    opts = {
        signs = {
            word_diff = true,
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "" },
            topdelete = { text = "" },
            changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(gs.next_hunk)
            end, "Next Hunk")

            map("n", "[c", function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(gs.prev_hunk)
            end, "Prev Hunk")

            -- Actions
            map("n", "<leader>g", gs.refresh, "Refresh gitsignts")
            map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
            map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
            map("n", "<leader>gd", gs.diffthis, "Diff This")
            map("n", "<leader>gS", gs.stage_buffer)
            map("n", "<leader>gu", gs.undo_stage_hunk)
            map("n", "<leader>gR", gs.reset_buffer)
            map("n", "<leader>gp", gs.preview_hunk)
            map("n", "<leader>gb", function()
                gs.blame_line({ full = true })
            end)
            map("n", "<leader>gtb", gs.toggle_current_line_blame)
            map("n", "<leader>gd", gs.diffthis)
            map("n", "<leader>gD", function()
                gs.diffthis("~")
            end)
            map("n", "<leader>gtd", gs.toggle_deleted)
        end,
    },
}

return {
    fugitive,
    gitsigns,
}
