local copilot = {
    "zbirenbaum/copilot.lua",
    commit = "3fd7b50810ae4cccf8b38e4c509b1608f141a9e9",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = false,
                auto_trigger = false,
                debounce = 500, -- delay in ms before Copilot suggestions show
            },
            panel = { enabled = false },
        })
    end,
}

local copilot_cmp = {
    "zbirenbaum/copilot-cmp",
    commit = "15fc12af3d0109fa76b60b5cffa1373697e261d1",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
        require("copilot_cmp").setup()
    end,
}

return {
    copilot,
    copilot_cmp,
}
