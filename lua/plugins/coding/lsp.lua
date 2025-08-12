local mason = {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
}

local mason_lsp_config = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        { "williamboman/mason.nvim" },
        {
            "neovim/nvim-lspconfig",
            version = "*",
        },
    },
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
                local null_ls_sources = require("null-ls.sources").get_available(vim.bo.filetype, "NULL_LS_FORMATTING")
                if #null_ls_sources > 0 then
                    client.server_capabilities.documentFormattingProvider = false
                end
            end
        end
    end,
}

local nvim_lspconfig = {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/SchemaStore.nvim" },
    config = function()
        local lspconfig = require("lspconfig")
        local schemastore = require("schemastore")

        lspconfig.yamlls.setup({
            settings = {
                yaml = {
                    validate = true,
                    format = { enable = true },
                    hover = true,
                    completion = true,
                    schemaStore = {
                        enable = true, -- disable builtin, use SchemaStore.nvim
                        url = "",
                    },
                    schemas = vim.tbl_extend(
                        "force",
                        schemastore.yaml.schemas({
                            select = {
                                "GitHub Workflow",
                                "GitHub Action",
                            },
                        }),
                        {
                            -- Optional: map specific patterns
                            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                            ["https://json.schemastore.org/github-action.json"] = "/.github/action.{yml,yaml}",
                            ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.33.1-standalone-strict/all.json"] = {
                                "*.k8s.yaml",
                                "*.k8s.yml",
                                "k8s/*.yaml",
                                "k8s/*.yml",
                                "manifests/*.yaml",
                                "manifests/*.yml",
                                "deployments/*.yaml",
                                "deployments/*.yml",
                            },
                        }
                    ),
                },
            },
        })
    end,
}

local cmp = {
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
}
local none_ls = {
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
}
local mason_none_ls = {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    config = function()
        require("mason-null-ls").setup({
            ensure_installed = {
                "stylua", -- Lua
                "gofumpt", -- Go
                "yamlfmt", -- YAML
                "yamllint", -- YAML
                "terraform_fmt", -- Terraform
                "tflint", -- Terraform
            },
            automatic_installation = true,
        })
    end,
}
local trouble = {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",              desc = "Diagnostics (Trouble)" },
        { "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
        { "<leader>xl", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location List (Trouble)" },
        { "<leader>xq", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix List (Trouble)" },
    },
}
local lsp_signature = {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = {
        bind = true,
        handler_opts = {
            border = "rounded",
        },
        hint_enable = true,
        hint_prefix = " ",
        floating_window = true, -- set to true if you prefer a popup
    },
    config = function(_, opts)
        require("lsp_signature").setup(opts)
    end,
}

return {
    -- Mason (LSP/DAP/Tools installer)
    mason,
    -- Mason LSPConfig (LSP server management)
    mason_lsp_config,
    -- Nvim CMP + Snippets
    cmp,
    -- null-ls for Formatters/Linters
    none_ls,
    -- Mason integration for null-ls
    mason_none_ls,
    trouble,
    lsp_signature,
    nvim_lspconfig,
}
