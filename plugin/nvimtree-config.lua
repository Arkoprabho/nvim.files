local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "s", cb = tree_cb("vsplit") },
        { key = "v", cb = tree_cb("split") },
        { key = "t", cb = tree_cb("tabnew") },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
