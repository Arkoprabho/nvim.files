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
    },
}

return {
    nvim_devicons,
    monokai,
    bufferline
}
