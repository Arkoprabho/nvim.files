return require("packer").startup(function()
	-- Packer can manager itself
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Projecet and session management
	use("rmagatti/auto-session")
	use({
		"rmagatti/session-lens",
		requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
	})

	-- File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Status
	use("nvim-lualine/lualine.nvim")

	-- Bar
	use("romgrk/barbar.nvim")
	-- Development plugins
	use("mg979/vim-visual-multi")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")

	--- LSP Config
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("onsails/lspkind.nvim")
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
	})
	use("jose-elias-alvarez/null-ls.nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")
end)
