local icons = require("settings.icons")
local mocha = require("catppuccin.palettes").get_palette("mocha")
require("bufferline").setup({
	highlights = require("catppuccin.groups.integrations.bufferline").get({
		styles = { "italic", "bold" },
		custom = {
			all = {
				fill = { bg = "#000000" },
			},
			mocha = {
				background = { fg = mocha.text },
			},
			latte = {
				background = { fg = "#000000" },
			},
		},
	}),
	options = {
		mode = "tabs",
		numbers = "buffer_id",
		buffer_close_icon = icons.ui.Close,
		diagnostics = "nvim_lsp",
		modified_icon = icons.ui.Circle .. " ",
		separator_style = { icons.separator.filled_right, icons.separator.filled_right },
	},
})
