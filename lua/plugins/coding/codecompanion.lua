local codecompanion = {
	"olimorris/codecompanion.nvim",
	keys = {
		{ "<leader>ai", "<cmd>CodeCompanionChat<cr>", desc = "Open CodeCompanion" },
		{ "<leader>cai", "<cmd>CodeCompanion /commit<cr>", desc = "Generate commit message" },
	},
	cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"zbirenbaum/copilot.lua",
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
				acp = {
					-- Define the Gemini CLI adapter using ACP
					gemini_cli = function()
						return require("codecompanion.adapters").extend("gemini_cli", {
							name = "gemini_cli",
							cmd = { "gemini" },
							defaults = {
								auth_method = "gemini-api-key",
							},
							env = {
								GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
							},
							schema = {
								model = {
									default = "gemini-2.5-flash-lite",
								},
							},
						})
					end,
				},
				-- Claude Code CLI adapter
				http = {
					copilot = function()
						return require("codecompanion.adapters").extend("copilot", {
							name = "copilot",
							schema = {
								model = {
									default = "gpt-4.1",
								},
							},
						})
					end,
					claude_code = function()
						return require("codecompanion.adapters").extend("claude_code", {
							name = "claude_code",
							cmd = {
								"claude",
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
									default = "haiku",
									choices = { "haiku" },
								},
							},
						})
					end,
				},
			},
			interactions = {
				chat = {
					adapter = "copilot",
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
					adapter = "copilot",
				},
				agent = {
					adapter = "copilot",
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
