local tree_cb = require("nvim-tree.config").nvim_tree_callback
require("nvim-tree").setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	sort_by = "case_sensitive",
	view = {
		side = "right",
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
		highlight_git = true,
		group_empty = true,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})
