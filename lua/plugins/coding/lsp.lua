return {
    -- Mason (LSP/DAP/Tools installer)
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },

    -- Mason LSPConfig (LSP server management)
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "yamlls", "terraformls" },
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, { buffer = bufnr, desc = "Format file" })

                -- Disable LSP formatting if null-ls provides a formatter
                if client.name ~= "null-ls" then
                    local null_ls_sources =
                        require("null-ls.sources").get_available(vim.bo.filetype, "NULL_LS_FORMATTING")
                    if #null_ls_sources > 0 then
                        client.server_capabilities.documentFormattingProvider = false
                    end
                end
            end

            for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end
        end,
    },

    -- Nvim CMP + Snippets
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },

    -- null-ls for Formatters/Linters
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "jay-babu/mason-null-ls.nvim", "williamboman/mason.nvim" },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- Lua
                    null_ls.builtins.formatting.stylua,

                    -- Go
                    null_ls.builtins.formatting.gofumpt,

                    -- YAML
                    null_ls.builtins.formatting.yamlfmt,
                    null_ls.builtins.diagnostics.yamllint,

                    -- Terraform
                    null_ls.builtins.formatting.terraform_fmt,
                    null_ls.builtins.diagnostics.tflint,
                },
            })

            -- Autoformat on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end,
    },

    -- Mason integration for null-ls
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "stylua",        -- Lua
                    "gofumpt",       -- Go
                    "yamlfmt",       -- YAML
                    "yamllint",      -- YAML
                    "terraform_fmt", -- Terraform
                    "tflint",        -- Terraform
                },
                automatic_installation = true,
            })
        end,
    },
}
