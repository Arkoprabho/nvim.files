local actions = require("telescope.actions")
local icons = require("globals.icons")
require("telescope").setup({
	defaults = {
		borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
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
		live_grep = {
			additional_args = function(opts)
				return { "--hidden" }
			end,
		},
	},
})

require("telescope").load_extension("neoclip")
require("telescope").load_extension("notify")
require("telescope").load_extension("dap")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("gh")

-- Mappings
local map = vim.keymap.set
local builtin = require("telescope.builtin")
local github = require("telescope").extensions.gh

map("n", "<A-F>", builtin.live_grep)
map("n", "<leader>pv", builtin.find_files)
map("n", "<C-f>", builtin.git_files)
map("n", "<leader>T", builtin.builtin)
map("n", "<leader>ghpr", github.pull_request)
map("n", "<leader>ghbr", builtin.git_branches)
map("n", "<leader>ghi", github.issues)
