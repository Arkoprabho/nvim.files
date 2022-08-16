return require('packer').startup(function()
	-- packer can manager itself
	use 'wbthomason/packer.nvim'
	
	-- colorscheme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- File Explorer
    use 'kyazdani42/nvim-tree.lua'
end)
