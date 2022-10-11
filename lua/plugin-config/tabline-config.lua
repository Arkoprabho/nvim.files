local icons = require("settings.icons")
require("bufferline").setup({
	options = {
		mode = "tabs",
		numbers = "buffer_id",
		buffer_close_icon = icons.ui.Close,
		diagnostics = "nvim_lsp",
		modified_icon = icons.ui.Circle .. " ",
		separator_style = "thin",
		-- separator_style = { icons.separator.filled_right, icons.separator.filled_right },
	},
})
