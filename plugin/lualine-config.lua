require("lualine").setup({
	options = {
		theme = "catppucin",
	},
	sections = { lualine_c = { require("auto-session-library").current_session_name } },
})
