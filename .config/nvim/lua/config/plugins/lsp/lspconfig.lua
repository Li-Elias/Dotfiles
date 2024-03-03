return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "<leader>o", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_nvim_lsp.default_capabilities())

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "html",
                "cssls",
            },
            handlers = {
                -- default setup
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                -- custom settings for lsp
                lua_ls = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    library = {
                                        vim.env.VIMRUNTIME,
                                    },
                                },
                            },
                        },
                    })
                end,

                gopls = function()
                    lspconfig.gopls.setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = {
                            gopls = {
                                completeUnimported = true,
                                usePlaceholders = true,
                                analyses = {
                                    unusedparams = true,
                                },
                            },
                        },
                    })
                end,

                html = function()
                    lspconfig.html.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        filetypes = { "html", "templ" },
                    })
                end,

                htmx = function()
                    lspconfig.htmx.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        filetypes = { "html", "templ" },
                    })
                end,

                tailwindcss = function()
                    lspconfig.tailwindcss.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        filetypes = { "templ", "javascript", "typescript", "svelte" },
                        init_options = { userLanguages = { templ = "html" } },
                    })
                end,
            }
        })
    end,
}
