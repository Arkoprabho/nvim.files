require("monokai-pro").setup({
	transparent_background = true,
	devicons = true, -- highlight the icons of `nvim-web-devicons`
	background_clear = {
		"toggleterm",
		"float-win",
	},
	day_night = {
		enable = true, -- turn off by default
		day_filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
		night_filter = "ristretto", -- classic | octagon | pro | machine | ristretto | spectrum
	},
})
vim.cmd([[colorscheme monokai-pro]])
