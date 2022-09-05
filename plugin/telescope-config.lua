local telescope = require("telescope")

telescope.load_extension("neoclip")
telescope.load_extension("notify")
telescope.load_extension("bookmarks")

telescope.setup({
	prompt_prefix = " ",
	selection_caret = " ",
	path_display = { "smart" },
})
