require("lualine").setup({
	options = {
		theme = "catppuccin",
	},
	sections = { lualine_c = { require("auto-session-library").current_session_name } },
})
