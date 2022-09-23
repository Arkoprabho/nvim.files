-- vim.g.catpuccin_flavour = "mocha"

require("tokyonight").setup({
	style = "night",
	terminal_colors = true,
	dim_inactive = true,
	lualine_bold = true,
})

vim.cmd([[colorscheme tokyonight ]])

-- local everblush = require("everblush")
--
-- everblush.setup({ nvim_tree = { contrast = true } })
