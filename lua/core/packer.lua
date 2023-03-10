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
		commit = "d3dd30ff0b811756e735eb9020609fa315bfbbcc",
	})

	-- Colorscheme
	use({
		"kyazdani42/nvim-web-devicons",
		commit = "189ad3790d57c548896a78522fd8b0d0fc11be31",
	})

	use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
	-- Notification
	use({
		"rcarriga/nvim-notify",
		commit = "e7cb3e5f93b1fef6a713dbc182eff98badfc6dd4",
	})

	-- File Explorer
	use({
		"ThePrimeagen/harpoon",
		commit = "21d0d1bfa3000e4384740bfaefa0ebc51c773786",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"kyazdani42/nvim-tree.lua",
		commit = "b17358ff4d822deeb42b97919065800f8f91cb55",
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
	use({
		"nvim-lualine/lualine.nvim",
		commit = "b6314ac556098d7abea9bb8cf896d2e3500eca41",
	})

	-- Tabline
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.12.*",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Development plugins
	use({
		"mfussenegger/nvim-dap",
		commit = "61643680dcb771a29073cd432894e2f81a7c2ae3",
	})
	use({
		"rcarriga/nvim-dap-ui",
		tag = "v2.1.*",
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
	})

	--- LSP Config
	use({
		"williamboman/mason.nvim",
		commit = "2e83e412d877a7e6daf04b2b6359521f6fb8c20e",
	})
	use({
		"WhoIsSethDaniel/lualine-lsp-progress.nvim",
		commit = "16380c531efad8131ba0f395bdeb97fa2ae169f4",
	})
	use({
		"folke/trouble.nvim",
		commit = "929315ea5f146f1ce0e784c76c943ece6f36d786",
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
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		commit = "355f7012b4afd92c0387770f1bea892e74a91b2e",
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda",
	})

	-- Git
	use({
		"ldelossa/gh.nvim",
		commit = "bc731bb53909481995ac2edb4bf6418c051fec1a",
		requires = { { "ldelossa/litee.nvim" } },
	})
	use({
		"nvim-telescope/telescope-github.nvim",
		commit = "ee95c509901c3357679e9f2f9eaac3561c811736",
	})
	use({
		"f-person/git-blame.nvim",
		commit = "08e75b7061f4a654ef62b0cac43a9015c87744a2",
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
	})
	use({
		"lewis6991/gitsigns.nvim",
		tag = "v0.5",
	})
	-- Misc
	use({
		"folke/noice.nvim",
		tag = "v1.9.1",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})
	use({
		"christoomey/vim-tmux-navigator",
		commit = "cdd66d6a37d991bba7997d593586fc51a5b37aa8",
	})
	use({
		"echasnovski/mini.nvim",
		commit = "d7b2f437077da10819771f2404a6a3e581d44008",
	})
	use({
		"tpope/vim-sleuth",
		commit = "8332f123a63c739c870c96907d987cc3ff719d24",
	})
	use({
		"superhawk610/ascii-blocks.nvim",
		commit = "a8a7d99fc52df30d7c4e7664818542fd44839d97",
		cmd = { "AsciiBlockify" },
	})
	use({
		"anuvyklack/windows.nvim",
		commit = "e3a1217976d4ec8d2515cb634dbf5d26cabd46d5",
		requires = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim",
		},
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
		"p00f/nvim-ts-rainbow",
		commit = "064fd6c0a15fae7f876c2c6dd4524ca3fad96750",
	})
	use({
		"norcalli/nvim-colorizer.lua",
		commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6",
	})

	-- Golang related plugins
	use({
		"rafamadriz/friendly-snippets",
		commit = "6cd7469403fd06a3840a1065728d1affe1c23ec8",
	})
	use({
		"leoluz/nvim-dap-go",
		commit = "c2902bb96c45e872d947d7e174775e652439add4",
		ft = { "go" },
	})

	-- Python related plugins
	use({
		"mfussenegger/nvim-dap-python",
		commit = "27a0eff2bd3114269bb010d895b179e667e712bd",
	})

	-- Jenkins related plugin
	use({
		"martinda/Jenkinsfile-vim-syntax",
		commit = "0d05729168ea44d60862f17cffa80024ab30bcc9",
		ft = { "Jenkinsfile" },
	})
	use({
		"joshzcold/cmp-jenkinsfile",
		commit = "cf0b5dafc8239ac038da630f0c780a71d064866b",
		ft = { "Jenkinsfile" },
	})

	-- YAML related plugin
	use({
		"someone-stole-my-name/yaml-companion.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		tag = "0.1.3",
	})
end)
