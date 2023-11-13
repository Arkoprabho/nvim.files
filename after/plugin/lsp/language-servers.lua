local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
local navic = require("nvim-navic")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function Set(list)
	local set = {}
	for _, l in ipairs(list) do
		set[l] = true
	end
	return set
end

local disabled_document_formatting_clients =
	Set({ "sumneko_lua", "gopls", "yamlls", "tsserver", "dockerls", "kotlin_language_server" })
local on_attach = function(client, bufnr)
	if disabled_document_formatting_clients[client.name] then
		client.server_capabilities.document_formatting = false
	end
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "<leader>qf", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-S>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
local servers = { "pyright", "tsserver", "terraformls", "csharp_ls", "gopls", "dockerls", "kotlin_language_server" }
local lspconfig = require("lspconfig")
lspconfig["gopls"].setup({
	on_attach = function(client, bufnr)
		require("lsp_signature").on_attach(client, bufnr)
	end,
	settings = {
		gopls = {
			gofumpt = true, -- Enable 'gofumpt' for source code formatting
			staticcheck = true, -- Enable 'staticcheck' for linting
			importShortcut = "Both", -- Include import statements for both definitions and references
			symbolMatcher = "Fuzzy", -- Set symbol matcher to fuzzy matching
			-- codelenses = {
			-- 	gc_details = true, -- Enable/Disable the GC details lens
			-- 	regenerate_cgo = true, -- Enable/Disable the 'regenerate cgo' lens
			-- 	tidy = true, -- Enable/Disable the 'tidy' lens
			-- 	upgrade_dependency = true, -- Enable/Disable the 'upgrade dependency' lens
			-- 	vendor = true, -- Enable/Disable the 'vendor' lens
			-- },
			analyses = {
				unusedparams = true, -- Report unused function parameters
				fieldalignment = true, -- Find structs that would take less memory if their fields were sorted
			},
			usePlaceholders = true, -- Enable placeholders for function parameters when completing function calls
			-- completeUnimported = true, -- Enable completion of unimported packages
			matcher = "CaseSensitive", -- Change the default matcher to be case-sensitive
			-- experimentalPostfixCompletions = true, -- Enable experimental postfix completions
			-- allExperiments = true, -- Enable all code lenses. This option is intended for testing only
			hoverKind = "FullDocumentation", -- Toggle between 'NoDocumentation' and 'FullDocumentation'
			linkTarget = "pkg.go.dev", -- If hoverKind is set to FullDocumentation, this option controls where documentation links go: 'godoc.org' or 'pkg.go.dev'
			-- buildFlags = { "-tags", "integration" }, -- Specify build flags for the workspace. Each string is a separate flag.
		},
	},
})

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		flags = lsp_flags,
		capabilities = capabilities,
	})
end

lspconfig["sumneko_lua"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		Lua = {
			format = {
				enable = false,
			},
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "use" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- YAML Language server
local yaml_companion = require("yaml-companion").setup({
	-- Built in file matchers
	builtin_matchers = {
		-- Detects Kubernetes files based on content
		kubernetes = { enabled = true },
		cloud_init = { enabled = true },
	},

	-- Additional schemas available in Telescope picker
	schemas = {
		result = {
			{
				name = "Kubernetes 1.22.4",
				uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json",
			},
			{
				name = "Kubernetes 1.26.0",
				uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.26.0-standalone-strict/all.json",
			},
		},
	},

	-- Pass any additional options that will be merged in the final LSP config
	lspconfig = {
		flags = {
			debounce_text_changes = 150,
		},
		settings = {
			redhat = { telemetry = { enabled = false } },
			yaml = {
				validate = true,
				format = { enable = true },
				hover = true,
				schemaStore = {
					enable = true,
					url = "https://www.schemastore.org/api/json/catalog.json",
				},
				schemaDownload = { enable = true },
				schemas = {},
				trace = { server = "debug" },
			},
		},
	},
})

lspconfig["yamlls"].setup(yaml_companion)
require("telescope").load_extension("yaml_schema")

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
