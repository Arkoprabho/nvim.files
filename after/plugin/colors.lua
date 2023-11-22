require("monokai-pro").setup({
	transparent_background = true,
	filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
	devicons = true, -- highlight the icons of `nvim-web-devicons`
	background_clear = {
		"toggleterm",
		"telescope",
		"float-win",
	},
	day_night = {
		enable = false, -- turn off by default
		day_filter = "ristretto", -- classic | octagon | pro | machine | ristretto | spectrum
		night_filter = "machine", -- classic | octagon | pro | machine | ristretto | spectrum
	},
})
vim.cmd([[colorscheme monokai-pro]])
