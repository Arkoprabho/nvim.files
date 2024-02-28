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

	use({
		"loctvl842/monokai-pro.nvim",
		commit = "70c384c43b9e19b59df3d6489b544ad4df155100",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})
	-- Notification
	use({
		"rcarriga/nvim-notify",
		commit = "5371f4bfc1f6d3adf4fe9d62cd3a9d44356bfd15",
	})

	-- File Explorer
	use({
		"ThePrimeagen/harpoon",
		commit = "c1aebbad9e3d13f20bedb8f2ce8b3a94e39e424a",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"kiran94/s3edit.nvim",
		tag = "v1.1.1",
	})
	use({
		"kyazdani42/nvim-tree.lua",
		commit = "b17358ff4d822deeb42b97919065800f8f91cb55",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	})
	use({
		"stevearc/oil.nvim",
		commit = "64d2f305d30cec13938aa99f8f13bd84c502e020",
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
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
		commit = "e154fdb6d70b3765d71f296e718b29d8b7026a63",
	})
	use({
		"rcarriga/nvim-dap-ui",
		tag = "v3.9.1",
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
		tag = "v0.9.1",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	--- LSP Config
	use({
		"David-Kunz/gen.nvim",
		commit = "41ad952c8269fa7aa3a4b8a5abb44541cb628313",
	})
	use({
		"ray-x/lsp_signature.nvim",
		commit = "1fba8f477b8c65add5e07cda0504cf7f81a9a4ab",
	})
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
		commit = "aa199c5bbdbb7fd28b56212a89206f13db02799e",
	})
	use({
		"hrsh7th/cmp-path",
		commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
	})
	use({
		"stevearc/aerial.nvim",
		commit = "88764566f96bf900a64b3dcd6d178cfb69b1c8ce",
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
		"chrisgrieser/nvim-scissors",
		dependencies = "nvim-telescope/telescope.nvim",
		commit = "f7a24fbbb10c1c87f1907e57de5f384cc01baf24",
	})
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
		"nvim-telescope/telescope-github.nvim",
		commit = "ee95c509901c3357679e9f2f9eaac3561c811736",
	})
	use({
		"NeogitOrg/neogit",
		requires = "nvim-lua/plenary.nvim",
		commit = "015c27c5b74eba9b151c683579c838e742bf36a2",
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
		"lewis6991/gitsigns.nvim",
		tag = "v0.5",
	})
	-- Misc
	use({
		"carbon-steel/detour.nvim",
		commit = "087bbcfce3a7e3e9c4defa420493132bbdd16499",
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
		commit = "68f554702de63f4b7b6b6d4bcb10178f41a0acc7",
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
		commit = "2806d83e3965017382ce08792ee527e708fa1bd4",
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
		commit = "a5cc8dcad43f0732585d4793deb02a25c4afb766",
		ft = { "go" },
	})

	-- Python related plugins
	use({
		"mfussenegger/nvim-dap-python",
		commit = "27a0eff2bd3114269bb010d895b179e667e712bd",
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
