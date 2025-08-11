local spectre = {
  "nvim-pack/nvim-spectre",
  cmd = "Spectre",
  keys = {
      { "<leader>sw", function() require("spectre").open_visual({select_word=true}) end, {desc = "Search current word"}},
      { "<leader>sp", function() require("spectre").open_file_search({select_word=true}) end, {desc = "Search on current file"}},
      { "<leader>sr", function() require("spectre").open() end, desc = "Search and Replace (Spectre)" },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
}

return {
    spectre
}
