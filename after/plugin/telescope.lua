local telescope = require("telescope")
local actions = require("telescope.actions")
local icons = require("globals.icons")

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

-- Mappings
local map = vim.keymap.set
local builtin = require("telescope.builtin")

map("n", "<A-F>", builtin.live_grep)
map("n", "<leader>pv", builtin.find_files)
map("n", "<C-f>", builtin.git_files)
map("n", "<leader>T", builtin.builtin)
map("n", "<leader>ghbr", builtin.git_branches)
