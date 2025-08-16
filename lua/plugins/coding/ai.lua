local ai = {
    "olimorris/codecompanion.nvim",
    version = "v17.15.0",
    opts = {
        strategies = {
            chat = {
                adapter = "qwen3",
            },
        },
        adapters = {
            qwen3 = function()
                return require("codecompanion.adapters").extend("ollama", {
                    name = "qwen3", -- Give this adapter a different name to differentiate it from the default ollama adapter
                    opts = {
                        vision = true,
                        stream = true,
                    },
                    schema = {
                        model = {
                            default = "qwen2.5:3b-instruct-q8_0",
                        },
                        num_ctx = {
                            default = 16384,
                        },
                        think = {
                            default = false,
                            -- or, if you want to automatically turn on `think` for certain models:
                            -- default = function(adapter)
                            --     -- this'll set `think` to true if the model name contain `qwen3` or `deepseek-r1`
                            --     local model_name = adapter.model.name:lower()
                            --     return vim.iter({ "qwen3", "deepseek-r1" }):any(function(kw)
                            --         return string.find(model_name, kw) ~= nil
                            --     end)
                            -- end,
                        },
                        keep_alive = {
                            default = "5m",
                        },
                    },
                })
            end,
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}

return {
    ai,
}
