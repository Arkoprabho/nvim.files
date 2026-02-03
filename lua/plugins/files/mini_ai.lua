local mini_ai = {
    "nvim-mini/mini.ai",
    version = "v0.16.0",
    event = "VeryLazy",
    keys = {
        { mode = { "x", "o" }, "a", desc = "mini.ai" },
        { mode = { "x", "o" }, "i", desc = "mini.ai" },
    },
    config = function()
        require("mini.ai").setup()
    end,
}

return {
    mini_ai,
}
