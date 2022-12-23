-- vim.g.catpuccin_flavour = "mocha"

require("tokyonight").setup({
	style = "night",
	terminal_colors = true,
	dim_inactive = true,
	lualine_bold = true,
	transparent = false, -- Enable this to disable setting the background color
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help", "packer" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
})

vim.cmd([[colorscheme tokyonight ]])

-- local everblush = require("everblush")
--
-- everblush.setup({ nvim_tree = { contrast = true } })
