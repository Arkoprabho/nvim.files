local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "lua",
      "go",
      "kotlin",
      "terraform",
      "hcl",
      "yaml",
      "bash",
      "dockerfile",
      "json",
      "make",
      "markdown"
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        scope_incremental = "<S-CR>",
        node_decremental = "<BS>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

local treesitter_context = {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    enable = true,           -- Enable this plugin (Can be disabled later via command)
    max_lines = 3,           -- How many lines the window should span. 0 = unlimited
    min_window_height = 0,   -- Minimum editor window height to enable context
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = "outer",    -- Which context lines to discard if max_lines is exceeded
    mode = "cursor",         -- Line used to calculate context: 'cursor' or 'topline'
    separator = nil,         -- Can be a string like '-' to use as a separator
    zindex = 20,             -- The Z-index of the context window
    on_attach = nil,         -- Function to call when attaching to a buffer
  },
  config = function(_, opts)
    require("treesitter-context").setup(opts)
  end,
}

return {
    treesitter,
    treesitter_context
}
