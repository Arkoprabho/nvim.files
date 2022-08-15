return require('packer').startup(function()
	-- packer can manager itself
	use 'wbthomason/packer.nvim'
	
	-- colorscheme
    use { "catppuccin/nvim", as = "catppuccin" }

end)
