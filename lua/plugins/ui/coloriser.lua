local coloriser = {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*", -- Apply to all filetypes
		}, {
			RGB = true, -- Enable RGB color codes
			RRGGBB = true, -- Enable RRGGBB color codes
			names = false, -- Disable color names
			RGBA = true, -- Enable RGBA color codes
			-- Other options can be added here as needed
		})
	end,
}

return {
	coloriser,
}
