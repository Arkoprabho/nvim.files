local icons = require("globals.icons")
local telescope = {
	"nvim-telescope/telescope.nvim",
	commit = "b4da76be54691e854d3e0e02c36b0245f945c2c7",
	cmd = "Telescope", -- Lazy load when using :Telescope
	keys = {
		{ "<leader>tgf", "<cmd>Telescope git_files<cr>", desc = "Find checked in files" },
		{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>tss", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>tH", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		{ "<leader>tgc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
		{ "<leader>tgs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required dependency
	},
	opts = {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
			},
			prompt_prefix = icons.ChevronRight,
			selection_caret = " ",
			layout_config = {
				horizontal = {
					preview_width = 0.6,
				},
			},
			layout_strategy = "horizontal",
			sorting_strategy = "ascending",
			prompt_position = "top",
			winblend = 5,
			border = true,
			preview = {
				hide_on_startup = false, -- Always show preview
			},
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true, -- Show hidden files
			},
		},
		extensions = {
			["ui-slect"] = {
				require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}),
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "TelescopeResults",
			command = "setlocal nofoldenable",
		})
		telescope.load_extension("ui-select")
	end,
}

local telescope_ui_picker = {
	"nvim-telescope/telescope-ui-select.nvim",
	commit = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2",
}

return {
	telescope_ui_picker,
	telescope,
}
