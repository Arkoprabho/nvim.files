local lualine_components = require("looks.lualine.components")
local git_blame = require("gitblame")
local icons = require("globals.icons")

require("lualine").setup({
	options = {
		theme = "tokyonight",
		globalstatus = true,
		component_separators = { left = icons.separator.hollow_right, right = icons.separator.hollow_left },
		section_separators = { left = icons.separator.filled_right, right = icons.separator.filled_left },
	},
	extensions = {
		"nvim-tree",
		"toggleterm",
	},
	sections = {
		lualine_a = { lualine_components.mode },
		lualine_b = { lualine_components.branch, lualine_components.diff },
		lualine_c = { lualine_components.lsp_progress, git_blame.get_current_blame_text },
		lualine_x = {
			lualine_components.lsp,
			lualine_components.spaces,
			lualine_components.filetype,
		},
		lualine_y = { lualine_components.progress },
		lualine_z = { lualine_components.location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { lualine_components.filename },
		lualine_x = { lualine_components.location },
		lualine_y = {},
		lualine_z = {},
	},
})
