local telescope = require("telescope")
local actions = require("telescope.actions")
local icons = require("settings.icons")

telescope.load_extension("neoclip")
telescope.load_extension("notify")
telescope.load_extension("dap")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close,
			},
		},
		prompt_prefix = icons.ui.Search .. " ",
		selection_caret = icons.ui.ChevronRight .. " ",
		path_display = { "smart" },
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
		},
	},
})
