local icons = require("globals.icons")
local indentscope = {
    "echasnovski/mini.indentscope",
    version = "*",
    opts = {
        draw = {
            delay = 100,
        },

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
            -- Textobjects
            object_scope = "ii",
            object_scope_with_border = "ai",

            -- Motions (jump to respective border line; if not present - body line)
            goto_top = "[i",
            goto_bottom = "]i",
        },

        options = {
            border = "both",
            indent_at_cursor = true,
            try_as_border = false,
        },
        symbol = icons.separator.fill_pipe,
    },
    init = function()
        -- Disable in certain filetypes (like help, NvimTree, etc.)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "NvimTree",
                "Trouble",
                "lazy",
                "mason",
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
    config = function(_, opts)
        require("mini.indentscope").setup(opts)
    end,
}

return {
    indentscope,
}
