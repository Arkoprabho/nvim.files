local codecompanion = {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
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
            },
            strategies = {
                chat = {
                    adapter = "gemini_cli",
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
                    adapter = "gemini_cli",
                },
                agent = {
                    adapter = "gemini_cli",
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
