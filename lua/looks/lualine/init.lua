local lualine_components = require("plugin-config.lualine.components")

require("lualine").setup({
	options = {
		theme = "tokyonight",
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	extensions = {
		"nvim-tree",
		"toggleterm",
	},
	sections = {
		lualine_a = { lualine_components.mode },
		lualine_b = { lualine_components.branch, lualine_components.diff },
		lualine_c = { lualine_components.filename, lualine_components.lsp_progress },
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
