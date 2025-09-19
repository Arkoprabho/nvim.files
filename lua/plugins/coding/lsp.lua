local mason = {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true,
}

local mason_lsp_config = {
    "williamboman/mason-lspconfig.nvim",
    version = "v2.1.0",
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
    commit = "3db16ceeea947517f0dc1404c24dcb5ab0c91d26",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim",
                        },
                    },
                },
            },
        })

        lspconfig.yamlls.setup({
            settings = {
                yaml = {
                    schemas = {
                        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.33.1-standalone-strict/deployment.json"] =
                        "**deployment.yaml",
                        -- Optional: map specific patterns
                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                        ["https://json.schemastore.org/github-action.json"] = "/.github/action.{yml,yaml}",
                    },
                },
            },
        })
    end,
}

local cmp = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",
            commit = "bd5a7d6db125d4654b50eeae9f5217f24bb22fd3",
        },
        {
            "saadparwaiz1/cmp_luasnip",
            commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90",
        },

        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local has_words_before = function()
            if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
                return false
            end
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
        end
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() and has_words_before() then
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
                { name = "nvim_lsp", group_index = 1 },
                { name = "luasnip",  group_index = 2 }, -- 🔑 add luasnip source
                { name = "copilot",  group_index = 3 },
                { name = "path",     group_index = 10 },
            }),
        })
    end,
}
local none_ls = {
    "nvimtools/none-ls.nvim",
    commit = "5fcb73913a9290f78097e34420fe0e6130c5c33c",
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
    commit = "85bedb7eb7fa331a2ccbecb9202d8abba64d37b3",
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
local lspsaga = {
    "nvimdev/lspsaga.nvim",
    commit = "8efe00d6aed9db6449969f889170f1a7e43101a1",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({
            ui = {
                border = "rounded",
                devicon = true,
                title = true,
            },
            symbol_in_winbar = {
                enable = true, -- disable if you use navic or want clean winbar
            },
            lightbulb = {
                enable = true,
                enable_in_insert = false,
            },
            outline = {
                win_width = 40,
            },
            implement = {
                enable = true,
            },
        })

        -- Make winbar backgrounds transparent
        vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE", fg = "#cdd6f4" }) -- current buffer
        vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE", fg = "#6c7086" }) -- unfocused buffers

        -- Keymaps
        local keymap = vim.keymap.set
        keymap("n", "<leader>lgh", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder" })
        keymap("n", "<leader>lgd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
        keymap("n", "<leader>lrn", "<cmd>Lspsaga rename ++project<CR>", { desc = "Rename" })
        keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })
        keymap("n", "<leader>lca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
        keymap("n", "<leader>la", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
        keymap("n", "<leader>tli", "<cmd>Telescope lsp_implementations<CR>", { desc = "Outline" })
        -- Call hierarchy
        keymap("n", "<leader>loc", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Peek Definition" })
        keymap("n", "<leader>lic", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Peek Definition" })

        -- Auto command to avoid folding
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "sagaoutline",
            command = "setlocal nofoldenable",
        })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- for syntax highlighting inside saga windows
        "nvim-tree/nvim-web-devicons", -- for icons
    },
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
    lspsaga,
}
