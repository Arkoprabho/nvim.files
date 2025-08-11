local surround = {
  "echasnovski/mini.surround",
  commit = "b12fcfefd6b9b7c9e9a773bc0e3e07ae20c03351",
  keys = {
    { "ya", mode = { "n", "v" }, desc = "Add surrounding" },
    { "yd", desc = "Delete surrounding" },
    { "yr", desc = "Replace surrounding" },
    { "yf", desc = "Find surrounding (to the right)" },
    { "yF", desc = "Find surrounding (to the left)" },
    { "yh", desc = "Highlight surrounding" },
  },
  opts = {
    -- You can customize mappings here if you want different keys
    mappings = {
      add = "ys", -- Add surrounding
      delete = "yd", -- Delete surrounding
      find = "yf", -- Find surrounding (to the right)
      find_left = "yF", -- Find surrounding (to the left)
      highlight = "yh", -- Highlight surrounding
      replace = "yr", -- Replace surrounding
      update_n_lines = "yn", -- Update `n_lines`
    },
    highlight_duration = 500,
  },
}

return {
    surround
}
