local telescope = require("telescope")
local actions = require("telescope.actions")
local icons = require("settings.icons")

telescope.load_extension("neoclip")
telescope.load_extension("notify")
telescope.load_extension("dap")
telescope.load_extension("harpoon")

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			vertical = {
				width = 0.9,
				height = 0.9,
				preview_height = 0.6,
				preview_cutoff = 0,
			},
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
		prompt_prefix = icons.ui.Search .. " ",
		selection_caret = " ",
		path_display = { "smart" },
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--no-ignore" },
		},
	},
})
