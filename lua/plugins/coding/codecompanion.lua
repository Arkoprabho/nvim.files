local codecompanion = {
	"olimorris/codecompanion.nvim",
	keys = {
		{ "<leader>ai", "<cmd>CodeCompanionChat<cr>", desc = "Open CodeCompanion" },
		{ "<leader>cai", "<cmd>CodeCompanion /commit<cr>", desc = "Generate commit message" },
	},
	cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"franco-ruggeri/codecompanion-spinner.nvim",
			version = "v0.2.3",
		},
	},
	version = "v18.3.2",
	config = function()
		require("codecompanion").setup({
			actions = true,
			prompt_library = {
				markdown = {
					dirs = {
						"~/.ai/prompts/",
					},
				},
			},
			adapters = {
				http = {
					opencode = function()
						return require("codecompanion.adapters").extend("opencode", {
							name = "opencode",
							cmd = {
								"opencode",
								"-p",
								"--output-format",
								"json",
								"--tools",
								"Bash,Edit,Read,Grep,Write,Glob,WebFetch",
							},
							defaults = {
								max_tokens = 8192,
							},
							schema = {
								model = {
									default = "gpt-4.1",
									choices = { "gpt-4.1", "claude-haiku-4.5", "claude-sonnet-4.5" },
								},
							},
						})
					end,
				},
			},
			interactions = {
				chat = {
					adapter = "opencode",
					tools = {
						["cmd_runner"] = {
							opts = {
								require_approval_before = true,
							},
						},
						["create_file"] = {
							opts = {
								require_approval_before = true,
							},
						},
						["edit_file"] = {
							opts = {
								require_approval_before = true,
							},
						},
						["delete_file"] = {
							opts = {
								require_approval_before = true,
							},
						},
					},
				},
				inline = {
					adapter = "opencode",
				},
				agent = {
					adapter = "opencode",
				},
			},
			extensions = {
				spinner = {
					active = true,
				},
			},
		})
	end,
}

return {
	codecompanion,
}
