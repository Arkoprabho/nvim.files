local harpoon = {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- ensure we install v2
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy", -- lazy load when Neovim is idle
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()

        -- Keymaps
        vim.keymap.set("n", "<leader>ha", function()
            harpoon:list():add()
        end, { desc = "Harpoon add file" })

        vim.keymap.set("n", "<leader>hh", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Harpoon menu" })

        vim.keymap.set("n", "<leader>h1", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader>h2", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader>h3", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader>h4", function()
            harpoon:list():select(4)
        end)

        -- Toggle previous/next buffers stored by harpoon
        vim.keymap.set("n", "<leader>hp", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "<leader>hn", function()
            harpoon:list():next()
        end)
    end,
}

return {
    harpoon,
}
