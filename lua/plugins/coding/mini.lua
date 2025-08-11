local pairs = {
    {
        "echasnovski/mini.pairs",
        version = "*",
        event = "InsertEnter",
        config = function()
            require("mini.pairs").setup({
                modes = { insert = true, command = false, terminal = false },
                mappings = {
                    ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
                    ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
                    ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

                    [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
                    ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
                    ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

                    ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
                    ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
                    ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },

                    [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
                },
            })
        end,
    },
}

local comment = {
    "echasnovski/mini.comment",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("mini.comment").setup({
            mappings = {
                comment = "gc",
                comment_line = "<leader>cc",
                textobject = "gc",
            },
        })
    end,
}

local jump = {
    "echasnovski/mini.jump2d",
    version = "*",
    keys = {
        {
            ",",
            function()
                require("mini.jump2d").start()
            end,
            desc = "Jump to visible text",
        },
    },
    config = function()
        require("mini.jump2d").setup({
            spotter = nil,

            -- Characters used for labels of jump spots (in supplied order)
            labels = "abcdefghijklmnopqrstuvwxyz",
            allowed_lines = {
                blank = true, -- Blank line (not sent to spotter even if `true`)
                cursor_before = true, -- Lines before cursor line
                cursor_at = true, -- Cursor line
                cursor_after = true, -- Lines after cursor line
                fold = true, -- Start of fold (not sent to spotter even if `true`)
            },
            allowed_windows = {
                current = true,
                not_current = true,
            },
            hooks = {
                before_start = nil, -- Before jump start
                after_jump = nil, -- After jump was actually done
            },
        })
    end,
}

return {
    pairs,
    comment,
    jump,
}
