local opencode = {
	"sudo-tee/opencode.nvim",
	commit = "2dba73d61d2c0f00f67eba51ba4110d94dd97e75",
	keys = {
		{ "<leader>.", "<cmd>Opencode<cr>", desc = "OpenCode" },
	},
	config = function()
		require("opencode").setup({
			preferred_picker = "telescope",
			preferred_completion = "nvim-cmp",
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			version = "v8.11.0",
			opts = {
				anti_conceal = { enabled = false },
				file_types = { "markdown", "opencode_output" },
			},
			ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
		},
		-- Optional, for file mentions and commands completion, pick only one
		"hrsh7th/nvim-cmp",

		-- Optional, for file mentions picker, pick only one
		{
			"folke/snacks.nvim",
			commit = "a4e46becca45eb65c73a388634b1ce8aad629ae0",
		},
		"nvim-telescope/telescope.nvim",
	},
}

return {
	opencode,
}
