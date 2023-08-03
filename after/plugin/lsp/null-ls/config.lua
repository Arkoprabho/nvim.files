local null_ls_status_ok, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false, bufnr = bufnr })
				end,
			})
		end
	end,
	sources = {
		formatting.stylua,
		formatting.gofmt,
		formatting.black,
		formatting.beautysh,
		formatting.trim_whitespace,
		formatting.terraform_fmt.with({
			extra_filetypes = { "hcl" },
		}),
		formatting.prettier,
		diagnostics.golangci_lint,
		diagnostics.hadolint,
		diagnostics.actionlint,
		diagnostics.shellcheck,
		code_actions.shellcheck,
	},
})
