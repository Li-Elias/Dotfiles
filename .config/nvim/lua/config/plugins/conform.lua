return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                go = { "gofumpt", "golines", "goimports", "goimports-reviser" },
            },
            format_on_save = {
                timeout_ms = 1000,
                async = false,
                lsp_fallback = false,
                -- filter = function(client)
                --     if client.name == "clangd" then
                --         return false
                --     else
                --         return true
                --     end
                -- end,
            },
        })
    end,
}
