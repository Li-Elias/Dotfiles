return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = {"html","css","c","lua","go","python","typescript"},

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = { enable = true },
        })
    end,
}
