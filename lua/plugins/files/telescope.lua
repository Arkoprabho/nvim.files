local icons = require("globals.icons")
local telescope = {
    "nvim-telescope/telescope.nvim",
    commit = "b4da76be54691e854d3e0e02c36b0245f945c2c7",
    cmd = "Telescope", -- Lazy load when using :Telescope
    keys = {
        { "<leader>tgf", "<cmd>Telescope git_files<cr>",   desc = "Find checked in files" },
        { "<leader>tf",  "<cmd>Telescope find_files<cr>",  desc = "Find files" },
        { "<leader>tss", "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
        { "<leader>tb",  "<cmd>Telescope buffers<cr>",     desc = "Find buffers" },
        { "<leader>th",  "<cmd>Telescope help_tags<cr>",   desc = "Help tags" },
        { "<leader>tgc", "<cmd>Telescope git_commits<cr>", desc = "Help tags" },
        { "<leader>tgs", "<cmd>Telescope git_status<cr>",  desc = "Help tags" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim", -- Required dependency
    },
    opts = {
        defaults = {
            prompt_prefix = icons.ChevronRight,
            selection_caret = " ",
            layout_config = {
                horizontal = {
                    preview_width = 0.6,
                },
            },
            layout_strategy = "horizontal",
            sorting_strategy = "ascending",
            prompt_position = "top",
            winblend = 5,
            border = true,
            preview = {
                hide_on_startup = false, -- Always show preview
            },
        },
        pickers = {
            find_files = {
                hidden = false, -- Show hidden files
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)
    end,
}

return {
    telescope,
}
