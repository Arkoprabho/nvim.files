local navic = {
	"SmiteshP/nvim-navic",
	lazy = true,
	dependencies = {
		{
			"neovim/nvim-lspconfig",
			version = "*",
		},
	},
	opts = {
		highlight = true, -- highlights symbols
		separator = "  ", -- breadcrumb separator
		depth_limit = 0, -- 0 = no limit
		depth_limit_indicator = "..",
		safe_output = true,
	},
	config = function(_, opts)
		local navic = require("nvim-navic")
		navic.setup(opts)

		-- Attach navic to LSP when available
		local lspconfig = require("lspconfig")
		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end
		end

		-- Example: attach to some LSPs
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = { diagnostics = { globals = { "vim" } } },
			},
		})

		lspconfig.gopls.setup({ on_attach = on_attach })
		lspconfig.yamlls.setup({ on_attach = on_attach })
		lspconfig.terraformls.setup({ on_attach = on_attach })
	end,
}

return {
	navic,
}
