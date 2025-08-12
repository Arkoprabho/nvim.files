local icons = require("globals.icons")
local signs = {
    Error = icons.diagnostics.Error,
    Warn = icons.diagnostics.Warning,
    Hint = icons.diagnostics.Hint,
    Info = icons.diagnostics.Information,
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float(nil, {
        scope = "line",     -- "line", "cursor" or "buffer"
        source = "always",  -- show source name (LSP, etc.)
        border = "rounded", -- nice border
    })
end, { desc = "Show diagnostics in popup" })
