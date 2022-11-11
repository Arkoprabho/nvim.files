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
	use({
		"lewis6991/impatient.nvim",
		commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6",
	})

	-- Colorscheme
	-- use({
	-- 	"catppuccin/nvim",
	-- 	as = "catppuccin",
	-- 	config = function()
	-- 		require("plugin-config.theme-config")
	-- 	end,
	-- })
	use({
		"kyazdani42/nvim-web-devicons",
		commit = "a8cf88cbdb5c58e2b658e179c4b2aa997479b3da",
	})

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
		commit = "6885b669523ff4238de99a7c653d47b081b5506d",
		config = function()
			require("plugin-config.which-key-config")
		end,
		opt = true,
	})

	-- Notification
	use({
		"rcarriga/nvim-notify",
		commit = "e7cb3e5f93b1fef6a713dbc182eff98badfc6dd4",
		config = function()
			require("plugin-config.neoclip-config")
		end,
	})

	-- File Explorer
	use({
		"ThePrimeagen/harpoon",
		commit = "4dfe94e633945c14ad0f03044f601b8e6a99c708",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"kyazdani42/nvim-tree.lua",
		commit = "875d38e52cc4367bad10e648a906a6bd73b3691c",
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
		commit = "edca2b03c724f22bdc310eee1587b1523f31ec7c",
		config = function()
			require("looks.lualine.init")
		end,
	})

	-- Tabline
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.12.*",
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
		commit = "6b12294a57001d994022df8acbe2ef7327d30587",
		config = function()
			require("dap.dap-config")
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		tag = "v2.1.*",
		config = function()
			require("plugin-config.dap-ui-config")
		end,
		requires = { "mfussenegger/nvim-dap" },
	})
	use({
		"nvim-telescope/telescope-dap.nvim",
		commit = "b4134fff5cbaf3b876e6011212ed60646e56f060",
	})
	use({
		"iamcco/markdown-preview.nvim",
		commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use({
		"mg979/vim-visual-multi",
		commit = "724bd53adfbaf32e129b001658b45d4c5c29ca1a",
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

	--- LSP Config
	use({
		"williamboman/mason.nvim",
		commit = "13217bbf59ed1e3d7633bd7e8e518b93a77e22c5",
		config = function()
			require("plugin-config.mason-config")
		end,
	})
	use({
		"WhoIsSethDaniel/lualine-lsp-progress.nvim",
		commit = "16380c531efad8131ba0f395bdeb97fa2ae169f4",
	})
	use({
		"folke/trouble.nvim",
		commit = "929315ea5f146f1ce0e784c76c943ece6f36d786",
		config = function()
			require("plugin-config.trouble-config")
		end,
	})
	use({
		"neovim/nvim-lspconfig",
		commit = "0a8064eda0c7a4475c4a8ceb39199e975308797b",
	})
	use({
		"hrsh7th/cmp-path",
		commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
	})
	use({
		"hrsh7th/nvim-cmp",
		commit = "0e436ee23abc6c3fe5f3600145d2a413703e7272",
	}) -- Autocompletion plugin
	use({
		"hrsh7th/cmp-nvim-lsp",
		commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8",
	}) -- LSP source for nvim-cmp
	use({
		"saadparwaiz1/cmp_luasnip",
		commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36",
	}) -- Snippets source for nvim-cmp
	use({
		"L3MON4D3/LuaSnip",
		tag = "v1.0.0",
		config = function()
			require("plugin-config.snippets-config")
		end,
	}) -- Snippets plugin
	use({
		"onsails/lspkind.nvim",
		commit = "c68b3a003483cf382428a43035079f78474cd11e",
	})
	use({
		"AckslD/nvim-neoclip.lua",
		commit = "73fd2494b181cdad5dca2be23bfefd6e34621fd2",
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
		commit = "355f7012b4afd92c0387770f1bea892e74a91b2e",
		config = function()
			require("lsp.null-ls.config")
		end,
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda",
		config = function()
			require("plugin-config.toggleterm-config")
		end,
	})

	-- Git
	use({
		"f-person/git-blame.nvim",
		commit = "08e75b7061f4a654ef62b0cac43a9015c87744a2",
		config = function()
			require("plugin-config.gitblame-config")
		end,
	})
	use({
		"kdheepak/lazygit.nvim",
		commit = "9c73fd69a4c1cb3b3fc35b741ac968e331642600",
	})
	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
		commit = "7e631e5da655dab31d1be10ba01a288f515ce6cc",
		opt = true,
		cmd = { "DiffviewOpen", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = function()
			require("plugin-config.diffview-config")
		end,
	})
	use({
		"lewis6991/gitsigns.nvim",
		tag = "v0.5",
		config = function()
			require("plugin-config.gitsigns-config")
		end,
	})
	-- Misc
	use({
		"echasnovski/mini.nvim",
		commit = "1e0a7aa0d62867974ae93a73fdd39e62d8d5b7af",
		config = function()
			require("plugin-config.mini-config")
		end,
	})
	use({
		"superhawk610/ascii-blocks.nvim",
		commit = "a8a7d99fc52df30d7c4e7664818542fd44839d97",
		cmd = { "AsciiBlockify" },
	})
	use({
		"gen740/SmoothCursor.nvim",
		commit = "abc2065f748f346c02bed19b3a075d561b20aa6f",
		config = function()
			require("plugin-config.smoothcursor-config")
		end,
	})
	use({
		"anuvyklack/windows.nvim",
		commit = "e3a1217976d4ec8d2515cb634dbf5d26cabd46d5",
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
		cmd = { "ZenMode" },
		commit = "6f5702db4fd4a4c9a212f8de3b7b982f3d93b03c",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		commit = "c46a8a0a60412a8fe43aa6bd3a01845c46de6bf2",
	})
	use({
		"norcalli/nvim-colorizer.lua",
		commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6",
		config = function()
			require("plugin-config.colorizer-config")
		end,
	})

	-- Golang related plugins
	use({
		"rafamadriz/friendly-snippets",
		commit = "6cd7469403fd06a3840a1065728d1affe1c23ec8",
	})
	use({
		"leoluz/nvim-dap-go",
		commit = "c2902bb96c45e872d947d7e174775e652439add4",
		config = function()
			require("dap.go-dap-config")
		end,
		ft = { "go" },
	})

	-- Python related plugins
	use({
		"mfussenegger/nvim-dap-python",
		commit = "27a0eff2bd3114269bb010d895b179e667e712bd",
	})
end)
