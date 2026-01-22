local opencode = {
    "NickvanDyke/opencode.nvim",
    commit = "364c7336562329f6c901629710070ea6ae256e3b",
    dependencies = {
        -- Recommended for `ask()` and `select()`.
        -- Required for `snacks` provider.
        ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
        {
            "folke/snacks.nvim",
            version = "v2.30.0",
            opts = { input = {}, picker = {}, terminal = {} },
        },
    },
    config = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {
            -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
        }
        vim.g.opencode_opts = {
            provider = {
                enabled = "terminal",
                terminal = {},
            },
        }
        -- Required for `opts.events.reload`.
        vim.o.autoread = true

        -- Recommended/example keymaps.
        vim.keymap.set({ "n", "x" }, "<leader>oca", function()
            require("opencode").ask("@this: ", { submit = true })
        end, { desc = "Ask opencode…" })
        vim.keymap.set({ "n", "x" }, "<leader>ocx", function()
            require("opencode").select()
        end, { desc = "Execute opencode action…" })
        vim.keymap.set({ "n", "t" }, "<leader>.", function()
            require("opencode").toggle()
        end, { desc = "Toggle opencode" })
    end,
}

return {
    opencode,
}
