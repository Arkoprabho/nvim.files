require("github-theme").setup({
	options = {
		darken = {
			floats = true,
			sidebar = {
				enable = true,
				list = { "nvim-tree" },
			},
		},
	},
})
vim.cmd([[colorscheme github_dark_dimmed ]])

require("colorizer").setup({
	"*", -- Highlight all files, but customize some others.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = false }, -- Disable parsing "names" like Blue or Gray
})
