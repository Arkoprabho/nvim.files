local packer = require("packer")

packer.init({
	profile = {
		enable = true,
		threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
	},
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
return packer.startup(function()
	-- Packer can manager itself
	use("wbthomason/packer.nvim")

	-- Performance
	use("lewis6991/impatient.nvim")

	-- Colorscheme
	-- use({
	-- 	"catppuccin/nvim",
	-- 	as = "catppuccin",
	-- 	config = function()
	-- 		require("plugin-config.theme-config")
	-- 	end,
	-- })
	use({
		"folke/tokyonight.nvim",
		commit = "3e79e043dfdc31b320d61432eae2eefc26478965",
		config = function()
			require("looks.colorscheme.theme")
		end,
	})
	-- use({ "Everblush/everblush.nvim", as = "everblush" })

	use({
		"folke/which-key.nvim",
		config = function()
			require("plugin-config.which-key-config")
		end,
		opt = true,
	})

	-- Notification
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("plugin-config.neoclip-config")
		end,
	})

	-- File Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("plugin-config.nvimtree-config")
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugin-config.telescope-config")
		end,
	})
	-- Status
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("looks.lualine.init")
		end,
	})

	-- Tabline
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("plugin-config.tabline-config")
		end,
	})
	-- use({
	-- 	"romgrk/barbar.nvim",
	-- 	config = function()
	-- 		require("plugin-config.bufferline-config")
	-- 	end,
	-- })
	-- Development plugins
	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("dap.dap-config")
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		config = function()
			require("plugin-config.dap-ui-config")
		end,
		requires = { "mfussenegger/nvim-dap" },
	})
	use("nvim-telescope/telescope-dap.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use("mg979/vim-visual-multi")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("plugin-config.comment-config")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "3e09c81b4c33bf14907b8a59025904d14c234b1e",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("plugin-config.treesitter-config")
		end,
	})
	use({
		"tpope/vim-fugitive",
		opt = true,
	}) -- Deprecated
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("plugin-config.surround-config")
		end,
		requires = {
			{ "nvim-treesitter/nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
	})
	use({ "tpope/vim-surround", opt = true }) -- Deprecated

	--- LSP Config
	use({
		"williamboman/mason.nvim",
		config = function()
			require("plugin-config.mason-config")
		end,
	})
	use({ "WhoIsSethDaniel/lualine-lsp-progress.nvim" })
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("plugin-config.lsp-lines-config")
		end,
	})
	use({
		"folke/trouble.nvim",
		config = function()
			require("plugin-config.trouble-config")
		end,
	})
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("plugin-config.snippets-config")
		end,
	}) -- Snippets plugin
	use("onsails/lspkind.nvim")
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
		config = function()
			require("plugin-config.neoclip-config")
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("lsp.null-ls.config")
		end,
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugin-config.toggleterm-config")
		end,
	})

	-- Git
	use({
		"f-person/git-blame.nvim",
		config = function()
			require("plugin-config.gitblame-config")
		end,
	})
	use({
		"kdheepak/lazygit.nvim",
	})
	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
		commit = "7e631e5da655dab31d1be10ba01a288f515ce6cc",
		config = function()
			require("plugin-config.diffview-config")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugin-config.gitsigns-config")
		end,
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugin-config.indent-blankline-config")
		end,
	})

	-- Misc
	use({
		"anuvyklack/windows.nvim",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
		config = function()
			require("plugin-config.windows-config")
		end,
	})
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
	use({
		"echasnovski/mini.nvim",
		branch = "stable",
		config = function()
			require("plugin-config.mini-config")
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugin-config.colorizer-config")
		end,
	})

	-- Golang related plugins
	use("rafamadriz/friendly-snippets")
	use({
		"leoluz/nvim-dap-go",
		config = function()
			require("dap.go-dap-config")
		end,
		ft = { "go" },
	})
end)
