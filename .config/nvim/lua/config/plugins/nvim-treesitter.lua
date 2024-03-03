return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "vimdoc", "lua" },

            sync_install = false,

            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },

            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
                filetypes = {
                    "html", "javascript", "typescript",
                    "javascriptreact", "typescriptreact",
                    "tsx", "jsx",
                    "svelte", "vue", "templ", "astro",
                    "xml", "markdown"
                }
            }

        })

        -- templ support
        vim.filetype.add({
            extension = {
                templ = "templ",
            },
        })
    end,
}
