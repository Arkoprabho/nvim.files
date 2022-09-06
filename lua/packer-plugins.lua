return require("packer").startup(function()
	-- Packer can manager itself
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use({ "catppuccin/nvim", as = "catppuccin" })
	-- use({ "Everblush/everblush.nvim", as = "everblush" })

	-- Bookmarks
	use("dhruvmanila/telescope-bookmarks.nvim")

	use({
		"folke/which-key.nvim",
	})

	-- Notification
	use("rcarriga/nvim-notify")

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
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use("mg979/vim-visual-multi")
	use("numToStr/Comment.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("tpope/vim-fugitive") -- Deprecated
	use("tpope/vim-surround")

	--- LSP Config
	use("folke/trouble.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-path")
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
	use("f-person/git-blame.nvim")
	use("kdheepak/lazygit.nvim")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("lewis6991/gitsigns.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	-- Misc
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("nvim-treesitter/nvim-treesitter-context")
	use("justinmk/vim-sneak")
	use({ "echasnovski/mini.nvim", branch = "stable" })
end)
