vim.g.catpuccin_flavour = "mocha"

require("catppuccin").setup({
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.5,
	},
	integrations = {
		treesitter = true,
		bufferline = true,
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = false,
		},
	},
})

vim.cmd([[colorscheme catppuccin ]])

-- local everblush = require("everblush")
--
-- everblush.setup({ nvim_tree = { contrast = true } })
