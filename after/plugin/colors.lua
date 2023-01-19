require("github-theme").setup({
	theme_style = "dimmed",
	sidebars = { "nvim-tree" },
})
vim.cmd([[colorscheme github_* ]])

require("colorizer").setup({
	"*", -- Highlight all files, but customize some others.
	css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
	html = { names = false }, -- Disable parsing "names" like Blue or Gray
})
