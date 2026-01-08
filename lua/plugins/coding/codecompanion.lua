local codecompanion = {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"zbirenbaum/copilot.lua",
		{
			"franco-ruggeri/codecompanion-spinner.nvim",
			version = "v0.2.3",
		},
	},
	version = "v17.33.0",
	config = function()
		require("codecompanion").setup({
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
			strategies = {
				chat = {
					adapter = "copilot",
					tools = {
						["cmd_runner"] = {
							opts = {
								requires_approval = true,
							},
						},
						["create_file"] = {
							opts = {
								requires_approval = true,
							},
						},
						["edit_file"] = {
							opts = {
								requires_approval = true,
							},
						},
						["delete_file"] = {
							opts = {
								requires_approval = true,
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
