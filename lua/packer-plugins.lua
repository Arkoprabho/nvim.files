local packer = require("packer")

local function exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, File exists
			return true
		end
	end
	return ok, err
end

local function git_exists()
	print("Checking if .git exists")
	return exists(".git/")
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})
return packer.startup(function()
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
	use("mfussenegger/nvim-dap")
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
			require("plugin-config.comment")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "3e09c81b4c33bf14907b8a59025904d14c234b1e",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use({
		"tpope/vim-fugitive",
		cond = git_exists(),
	}) -- Deprecated
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
	use({
		"sindrets/diffview.nvim",
		requires = "nvim-lua/plenary.nvim",
		commit = "7e631e5da655dab31d1be10ba01a288f515ce6cc",
		config = function()
			require("plugin-config.diffview")
		end,
	})
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

	-- Golang related plugins
	use("rafamadriz/friendly-snippets")
	use({
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
		ft = { "go" },
	})
end)
