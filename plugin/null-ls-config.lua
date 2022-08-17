local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.terraform_fmt,
        diagnostics.eslint,
        completion.spell,
    },
})
