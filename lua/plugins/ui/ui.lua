local icons = require("globals.icons")
local nvim_devicons = {
    "nvim-tree/nvim-web-devicons",
    commit = "c2599a81ecabaae07c49ff9b45dcd032a8d90f1a",
}

local monokai = {
    "loctvl842/monokai-pro.nvim",
    version = "v1.26.1",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("monokai-pro").setup({
          day_night = {
              enable = true,
              day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
              night_filter = "spectrum"
          },
          background_clear = { "float_win", "toggleterm", "telescope" },
          devicons = true,
          styles = {
            comment = { italic = true },
            keyword = { italic = true },
            type = { italic = true },
          },
        })
        vim.cmd.colorscheme("monokai-pro")
    end,
}

local bufferline = {
    "akinsho/bufferline.nvim",
    version = "v4.9.1",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
      { "<leader>1", "<CMD>BufferLineGoToBuffer 1<CR>", desc = "Move to buffer 1" },
      { "<leader>2", "<CMD>BufferLineGoToBuffer 2<CR>", desc = "Move to buffer 2" },
      { "<leader>3", "<CMD>BufferLineGoToBuffer 3<CR>", desc = "Move to buffer 3" },
      { "<leader>4", "<CMD>BufferLineGoToBuffer 4<CR>", desc = "Move to buffer 4" },
      { "<leader>5", "<CMD>BufferLineGoToBuffer 5<CR>", desc = "Move to buffer 5" },
      { "<leader>6", "<CMD>BufferLineGoToBuffer 6<CR>", desc = "Move to buffer 6" },
      { "<leader>7", "<CMD>BufferLineGoToBuffer 7<CR>", desc = "Move to buffer 7" },
      { "<leader>8", "<CMD>BufferLineGoToBuffer 8<CR>", desc = "Move to buffer 8" },
      { "<leader>C", "<CMD>tabclose<CR>", desc = "Close tab" },
    },
    opts = {
        options = {
            mode = "tabs",
            numbers = "ordinal",
            buffer_close_icon = icons.ui.Close,
            diagnostics = "nvim_lsp",
            modified_icon = icons.ui.Circle .. " ",
            separator_style = "thin",
            -- separator_style = { icons.separator.filled_right, icons.separator.filled_right },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
    end
}

return {
    nvim_devicons,
    monokai,
    bufferline
}
