return require('packer').startup(function()
	-- packer can manager itself
	use 'wbthomason/packer.nvim'
	
	-- Navigation
	use 'preservim/nerdtree'

	-- colorscheme
	use 'gruvbox-community/gruvbox'
end)
